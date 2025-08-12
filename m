Return-Path: <linux-gpio+bounces-24242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C60B22110
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 10:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E46F423E89
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 08:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A832E762F;
	Tue, 12 Aug 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SWUnhTWb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3942E611A
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987249; cv=none; b=qvr+5Cz+OMcbnsyQlz20zc0Ds/7AXyfF8pMqhvcYNnbpbY+M55qqtet9/hOvRLp3fC55LbDdy9wUcviR/lfa15b//U4dQ8QTI3LpoBvX4e+qr25+hdwLpa6ioG508nHvPKcsHoF1V7SKmPpCiC5iq+yuKUCZ46HH0XDKXuctG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987249; c=relaxed/simple;
	bh=HSTxkhC3WyBFM1G4jv4j8GQuTAWxbn2e8t0aXkOzg+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NigvZpXtSKE9tWBzSa57+zbPJ2cotYvLfa4P/CB+wETAycQsxpOes4qGCW4l2smoeCBJspqQ4lvWuTw/odIQvhACHHyPwLHeEG9iA+iFOYZjzoxP7QQYSyNylh+VZidG1XaMSOZGWEESZYME8oHoZrsevcDB7ZU9fSnmmYITIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SWUnhTWb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b792b0b829so5025694f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987242; x=1755592042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=SWUnhTWb1xVnvKDGPYatDL+5wF2w2vTEqjXDJBfPkjaL5IebY39EbDRzYTbpGbAfsT
         fLUTIposzew3vOcbt9acHAueXb8T7N1vT7XwJMWOvk3wXlDkm3VRktuI7cmrUxv2+hjf
         B62BRQ1EVzls9Z0QRfqsMdL5xnmFfTt6VJwDLKXNhxzWykbM95cRTDGRF8HATvPPo2z1
         QIIXLPtXGt22EWZgAGtl2DmLY3ZIvsF4nVaE0EdA0csIkKJCD6PsiungK1l89yY9yeyT
         XZO1BFe4c9gTvG7VOD6IS6RxgJU/eQ04WKN8586BmO6LbZz3lZvv7BuiZdQFy865m66T
         GNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987242; x=1755592042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=q2ENHpubhcO4+Dd/ANnJjWozXa6hWjAHaQ72ecEhK1JbrodLrj5IeZmsai5gzNhRG5
         FtcVr1Dab7wjwdijP3x7g8PYrjdaWI1iuU1P8dz6XKdE3MbCr/hFsJQZsY60Yfbgl//+
         5lQ1OnxAAAsxZD/RnjWW7t216lKtwxiCWrvyk1PBqrkvnz84hvMBOpe+rLHsq3jgNcdu
         h5AnhWXARCJ8ZIfiqFt2gY/pfudVN48FYVIAdSBZTeiG/jB+aDUxWOquhrvBSKtJeaBb
         Nrv6z/MEgeW11+7IEbE1yp+axQGJxPqQd0JIRXKTZRF3+q9xwtYJjSY4eW4JIbrg/354
         HBYA==
X-Gm-Message-State: AOJu0YyKk8rOPEz1gOAAIxMjLGK8OeOdvl974kzulflo3NXxsncDFHpq
	yKL5IvqKEiYHGfDd5z6wsU1zS9XEj+o2qGXeH20qgJJPS0Ewd72LKiG36AOf/rahSMu0VpmoaWF
	30ngk
X-Gm-Gg: ASbGnctHLW98xtIUIU7zeHhBiJCWU7O4vIyXu0pWEaRHDulWQ8nzmqrJPAa2gB2y8uH
	HQcI9YRP2belkrE6zcKmG8f0gmeVjJ7WcNwgZYnZdeg6U8IndK26vjEosj+ockVFs0lDe5A6FbD
	EB5uYst0OyZG1a8agOfCRUzsqUC3QBmPybNNpoKWEsxBaL5KaMInIxcmdbpMRObo4mRnW741ydo
	gdawOWE1OdKTiNU6iQNGAof7reDKu+VTZK9fY6np5okXlRNBnGUyLnqrwJLTknRMBicMTPGfC7Y
	XMLgVNng7XdcJqvIYr3D2OsSGsjkun6mV83vPCmWclbFKHjsWhhKooxU/+qOMIJwhCLTUCkzRLs
	a6fDHVntpGTgu2bs=
X-Google-Smtp-Source: AGHT+IE7RzdqszohpjnIT7cc2wTKSAeG24gAzL3U1lbvOrOc1qeSqca8LmuxQAuRcX6HqNeYGrkvjg==
X-Received: by 2002:a05:6000:2003:b0:3b8:d69b:93b with SMTP id ffacd0b85a97d-3b900b83ccdmr10680009f8f.52.1754987242087;
        Tue, 12 Aug 2025 01:27:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:07 +0200
Subject: [PATCH v4 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-8-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrY8MuBbR5f3WyoubwUxwTmfyIcSpxQ7Ha5S
 zLVYHlj+CuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cuHpEADDsPkguck9xZ93DDbHm+dAkW+gxRyBIFKg7MoqDE8bGz/PJcKk/1pqyE282dOw68stYlV
 vWEOPXQXbw6Kn/H8LprolH4tci+fdlUYSuFCVbwEZHEr12487UwAWk0X+B2HpqF5xcBnOdVh3aO
 XhnFfIkuVErPutmqWZP/8HbQNkc5ASjwIqSDD14dJHZf0wFw7eyA4KvYcWH472lCJ/KpQZgrFK1
 oL4rj410zLawPhIN0OT0AIYF1gECMQZsfoW6aXo0YqgMWt4z7/gVDJgbhpgs0nSWqB1/ri5wVg+
 9O17SbdM3avEKfy6ioY37j4RypySOqOaDC2cNt+/8RhGVM77rMBmEvMYESdtX9Sp3nySjpOPaeg
 5kQTLr7RSho6OQIM4GK8qciMCFnF9AcggpTOOw3GFWJKKWHUQOAdfJbiPyF56YUp13+rw2d52Zq
 qcBjz8+t3mIvEpCUr02fqA1yaeFZfjR/CmIlvEpkYCvBxW9o60l+SL7i4LNbQYppZQsZv7V6qwU
 59JLUvYSuDw2Z8OkViH9CzlRqd3PH3Z8ufgkHBFZX/jrwufWqycyN17bhs5PxI7xzO/JMD2q3rE
 Oyh+AdI+WlSwIi+nk/ccSPXY5Ru6x6NE9iJr8R11FGaDLpiRT1xMit6Vk9/CGA3AUU8FVayq/hP
 2n/7CMV5EcQpTVA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. We're working towards reducing the usage
of struct function_desc in pinctrl drivers - they should only be created
by pinmux core and accessed by drivers using
pinmux_generic_get_function(). This driver uses the data pointer so in
order to stop using struct function_desc, we need to provide an
alternative that also wraps the mux mode which is passed to pinctrl core
as user data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 6aefcbc31309995ec1e235416b40aab3e4a073a9..e78c8b3ec245aad56e3e74a26d27c41ba4a98281 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -135,6 +135,11 @@ struct keembay_pin_soc {
 	const struct pinctrl_pin_desc *pins;
 };
 
+struct keembay_pinfunction {
+	struct pinfunction func;
+	u8 mux_mode;
+};
+
 static const struct pinctrl_pin_desc keembay_pins[] = {
 	KEEMBAY_PIN_DESC(0, "GPIO0",
 			 KEEMBAY_MUX(0x0, "I2S0_M0"),
@@ -1556,13 +1561,13 @@ static int keembay_pinctrl_reg(struct keembay_pinctrl *kpc,  struct device *dev)
 }
 
 static int keembay_add_functions(struct keembay_pinctrl *kpc,
-				 struct function_desc *functions)
+				 struct keembay_pinfunction *functions)
 {
 	unsigned int i;
 
 	/* Assign the groups for each function */
 	for (i = 0; i < kpc->nfuncs; i++) {
-		struct function_desc *func = &functions[i];
+		struct keembay_pinfunction *func = &functions[i];
 		const char **group_names;
 		unsigned int grp_idx = 0;
 		int j;
@@ -1588,14 +1593,14 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 	/* Add all functions */
 	for (i = 0; i < kpc->nfuncs; i++)
 		pinmux_generic_add_pinfunction(kpc->pctrl, &functions[i].func,
-					       functions[i].data);
+					       &functions[i].mux_mode);
 
 	return 0;
 }
 
 static int keembay_build_functions(struct keembay_pinctrl *kpc)
 {
-	struct function_desc *keembay_funcs, *new_funcs;
+	struct keembay_pinfunction *keembay_funcs, *new_funcs;
 	int i;
 
 	/*
@@ -1614,7 +1619,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 		struct keembay_mux_desc *mux;
 
 		for (mux = pdesc->drv_data; mux->name; mux++) {
-			struct function_desc *fdesc;
+			struct keembay_pinfunction *fdesc;
 
 			/* Check if we already have function for this mux */
 			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
@@ -1628,7 +1633,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			if (!fdesc->func.name) {
 				fdesc->func.name = mux->name;
 				fdesc->func.ngroups = 1;
-				fdesc->data = &mux->mode;
+				fdesc->mux_mode = mux->mode;
 				kpc->nfuncs++;
 			}
 		}

-- 
2.48.1


