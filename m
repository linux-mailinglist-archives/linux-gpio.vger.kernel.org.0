Return-Path: <linux-gpio+bounces-25127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590CB3A578
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 18:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFAF9A047AE
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 16:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F0E2C11F0;
	Thu, 28 Aug 2025 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lj6cDzLy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02942286413
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396852; cv=none; b=oulBCBZuffuqrh5WfaxFM10HmsDodptVOykEK2yj+iJUisLtA/4rsLDas2nkfFzxavV53TXBOLOm6iEewB1N3Lw9YINwokpv2nrYz0U27KVxLbnUXH4vPs0px9JjDPjhkUkwWkKKt2qIdFQA+RfveZ/VGMXgn2MZAWb7P2+W9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396852; c=relaxed/simple;
	bh=RFujl0Cr/YaORxwURfe0zTKDzCwOsKiOevFTrddSrvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTHMpCwVy5iRGjreSKrP8QlLGLOc4khNIcPoDy/iI/PwIBeJ3XpXLEzP9ffXqvYiHM2uvjvgLiP/+E8gZWsoY0+XN85exhsKQS+qQw3TKIkmH8iYjOV5MUr9IGJdN9XdGEhSO4F20N/dJjDOielKeVXg8zq3XR2EPsxYrsjXWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lj6cDzLy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b627ea685so9069835e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396845; x=1757001645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=lj6cDzLyrRNsEyMJagBiifpMvsKgMTOdkDj9GZcnDUdSWk8ufFShfmn6oRBNCPJlYN
         wwlx/jCcxGFh6khQcBnZbVSSt9/FpDiM/wFcShxZ5HeSfuytoJ4T1tp9FKUK/l1m0BFu
         q2+YD88pNd3Pjy1l3WbdlWvJLqTuZNOe9qKuITPjHqN7g5HTb3jYgLLbrOJwQYHyRSBU
         zQyAVA77lFidrn70OCC+dt71w5oI+PcHzWsVqDJZTpHp4uRShQNIGsG5yO2u0wzoFhxT
         RNCoJOYHz+2KB202CXeBStzNzhhnqRlD/jatRgXT5zbTFhBq1hCXi34hUK8POyu4/k0H
         1Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396845; x=1757001645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=rTvKTi5p2xYYoAAE2rkWBDIkVKwIqCGq+S6D75Pu8n7EoKQFLc5IP+fPtApagQFKth
         zuKR8rBZcu0QN6JQ/JL6Qfz1xivzNdJov3ss0h4odfvPggUa23KzPzIPm198ZK8+j1/P
         nmC/1/Ej6Nkn8J4JeBzSz4kf8Hp67pQ8DbxLCBr333y1ID+eY68r/9T+LkvcLa6GxD7s
         PI628d6mc5nW9z0LUzrjn/BO3GwD3ANs6DnRDvZmi4gq4JkgithwBWZ8luxchDJCDBUo
         bDYyRw/bmLaLYDuKjkCHissuTM1gqBqjR9xIInWTvQ81YY5yQknTam0vRjOFijTAFXSH
         0ghQ==
X-Gm-Message-State: AOJu0YzfyoFB1Fef63FR30IBQdW4LxbaQegUdyxMhtcj6vvjpvs6/6qy
	p5sU08mQwuM9Fdtg1YnkSTllMjgbruvjGBh7qxf3trNIGeXynmh2P88m9rzElLDaRr8=
X-Gm-Gg: ASbGncvHp5u+hs2kb+3Kd+M5okb7bxKfA6iKQhO9BkkZYeMrMkMixvhmbHBrgbi4Zs0
	JxeAo38Y59dzvt/QqFTIG0mnh6fOHkBG9Ds42SKnE/RPCPEV318xT3wr8xdxUPkbuwuo4V9eqYo
	wvUuNVPU68i4ruA7NcjTBYgBw3mIbJLT4+5QDy0X4oaQ9y0mXPWb9v9FCeaENY4NpGI+eegNasv
	aKMkxvLIPidbyHeG8s0nbABrUtE7zI6AYVAiUk36IoSezwMF1cNH+Zn026cgoG8a09CqOL98RvE
	A19IcsO4IjFEUQi5y73EcTkf0Jkk6UYiOgtDL+fFtczzFjjk7+D/+h0ba/pgmVFN1S816A6eG1A
	7QoiZMeZs992LkVhxSw==
X-Google-Smtp-Source: AGHT+IH9eqAsu0mBkmZO1sLp4iQB82doTTOSGeYtxhUeFPIbPn5xY/WnY8KAWmQi9Jdt7MPymPYo1A==
X-Received: by 2002:a05:600c:4f05:b0:45b:5f5e:f1e4 with SMTP id 5b1f17b1804b1-45b648111dfmr100878215e9.27.1756396845191;
        Thu, 28 Aug 2025 09:00:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:23 +0200
Subject: [PATCH v6 15/15] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-15-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6AAfE1ZYIqFZsBoDZ4O1bJllvK/6bMXFJ6Zryc+i/E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PX+ObgCFGCgqoUrUjW902keUOxgLE8EUsB
 XcES2lA2qmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 ctL5D/9vpjY2JraOKI6xQLDzt9TXljIFuNDozQLvzOHyC9MgvKOWbsLqyOrunHPfrNqqKOFBK3T
 KwmfdS1uCAhkPVJFu9+QIjoLLd5p693JFSuHkObJvgCet04MNbRQLB5JHqL6iuH+bu9MyubXgwJ
 krZwBmRMnrDWPenruj6k4hAA2ihAQlUx9GOdKpiLfvYH8b6RAkHtDQPWjO21WqCLg4XFku4EESO
 5IruyaJkV3MTpbYIobh2C/a6mUW8SqezSSh1LG4Bd1XobET0b8+hWmght65TmOvonC+GLe5r2Wh
 pLFBhM0QRVLHeqtJgYx4uIqUU9M0k9AXIOR9238ttf3Ct3ldZ9ZfTONb3jNBXOp9939T7h4ZLpx
 SUaPlc2TzAFEbRUJNonPEbxaaa0+qbqTjF9ltT5tZC1Mlqr8pyzA1YH8BN9wyrbK4N6qH1ty3MJ
 6emE/yXMZFLsGd8hOSA+egnDYIO5BK1s91hpGWU/ZY/fadrMn6UtPYHf85JlfFzmhIlsS9nHjfY
 oLMcdYawGwDD/MdG1Dt9y2yWY+0T4iNxJoUqYKmpisWrARyHw/iR5VjqJFS50k88+CJMB1H36z0
 letY3JTa4NNIETPLbq0dvyWaZmnqCNmCzEgKPyWyC7sxmk66PTtyQoJj32nMAH62uZVZ+A6DZeE
 zit65McHjdrqSGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


