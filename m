Return-Path: <linux-gpio+bounces-11127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD39997D46
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 08:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F07AB22152
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 06:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB311A0BCA;
	Thu, 10 Oct 2024 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="aKUf0B/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B090E3D6B;
	Thu, 10 Oct 2024 06:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542064; cv=none; b=FN1BKbyf5VfQS2kzFwNk8sfQFtG275/j6VObG9n78gB5iULSrBRo7PepyEoZKDynvg4CXV8EtMn5vhcFWV36WrLWBW/0HqciXACOFAytwe6y5O3l8xwZM4sWRGIlwxzRCFkoW77b0TMZ9+alAL7EXp2uuTBGAoYrdy87KycKdEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542064; c=relaxed/simple;
	bh=n9KdWSYtOkDPUZ8+WHXTWzm0R5vDqUZAPIbwPNsnWTA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TtFj2ZnI3HWszl4UsuNF22661DQiV/UkOUVp14Ly7Qlm6GNccZbozj8yin9nw+dDpbirQGPdCS2eE2N6KO5kodxC6NGcquAkARF5PMs+w9j8493vUobj2/fO6J4ZTURZJpyUHTAAO9fCSiPYKLHTcFumq5udCcyjwn40KPS8Ons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=aKUf0B/s; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728542028; x=1729146828; i=markus.elfring@web.de;
	bh=qUNkm5MuOxf6IBBgFwcWmJvYdFILddjvzkOVjLt32J4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aKUf0B/s/s1c0xxdCZZxrFjr8kti99z1b8uoZEx73Bv1VPxMvI8+uptDNUqD3Ark
	 0beqcQLnO0E/NpB6m6eP0CpC8WCr1joQyQTNeRt0wqxaOuTkFxUJ/1KzNDhYcd/S9
	 aIXBRtu3ow3Vta8xWSwP5NUb+mHuuKw/Q1Df1zqbaBtyqKVvBbLBUfhzpb8FNueHQ
	 F5kujdJUhelUDIG0rJtSiRj5zmgofTPp/SPYfXkVOIpp5256tzThjFhe5cYT4dbiA
	 ABF5rI7j0X2KKxgedE5CPZqn0KbAUzTMXM6/Cj062ZgB3LH2LDYwBCzbwErhcPXSP
	 anBKuW6VNg9L0/WO6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2Phc-1szLEr3wLe-001VZe; Thu, 10
 Oct 2024 08:33:48 +0200
Message-ID: <89844cfc-f349-4515-a683-572c09c4143a@web.de>
Date: Thu, 10 Oct 2024 08:33:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Drew Fustini <drew@pdp7.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] pinctrl: th1520: Use common error handling code in
 th1520_pinctrl_dt_node_to_map()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HQ3BmE4H7byNJFSJkDiLtddpR/WLhnzeHaqc10HnvkaLhIYcKbt
 PanD5avtKht7V5P+L4T0o5BgKdtS9h/UY1i5qKLeOviAjeEFVnHVa+JsMqx730y4+KN836c
 fKxtvv221YlGZ9DlHTlZs5/GMfdxd71INGdnzuft+mqRc/JYLRxzcbwVZ+bCpTbG+mjdZ8r
 f64HhqLxit/i4H0zqkVkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+ttVb/jb5AI=;Wd/VkN8iGadL+vAUjxOjIlAciuD
 pyXE69ogDJSKGwJPDM0J6nd2zWXVyKrws0ilG2rhqWXUPMv5cRQCuzro2Mc6/9e6X8YqPPmyQ
 f2hYGO6LxVlmPojplG66BS3QRZapoTmraluDKv5YjjQIh5Qsrug9e01Ckskcl6+ScHSsNL9+d
 hQXjkJswt9iZnl8v2k+NSSrS831WGUxQ7EvjdkT0sXJKPBG70aC94SxOPCGM4nOzq+FUSMpv/
 ni2oSqlgXCBxnLc4z8ikvUsQQlD/D1QVOAWUiQ2IZyFwmalXRrizgHKmPOWtaBDtFM5XvglIh
 b+KRN1azZCmYEavMI3MObikm2yP/Y0yPDAyjgf7VwG6i/I4TGW82vyNgkj7HCj0dUSK88Sx43
 mWpuLLGbGmV4NBWFEmgNdxbTnJP38c3NU9bFTWH6+WNZGtn95JFX/vodVckM8C6i5QRoeKtWp
 lnPdvNTqL9VRhTKwZY4+5JaG/JvjmVUfN4sPQv4yAmg8Ymenf7WzvvRMG6fdcgvg7WABWlfyp
 XJ0y9B9J9tcByuzCO//HiRB1TYg5Cy76Evqe1YhUicplz75zcyMlSzb3hH/IBYCpQrYYkzXlj
 ANLXjA2cb0N5y1YUB/7OORDPTUiYnXmN8Y2k5f0LOjSupMhNfG1exjnHZk4VQnBT/P0EX/AQX
 YeCJLmD3qYdb6LG3xCk1UgBz806QEe4c6aEg4g27Gmbsj3bGfQv8edqIAOesiN4vkxXNYmOSi
 SonEpufsE2w31dS6y2EtuOuTHplNcNFpt2B4Fv919LgwJm2PbLWjhuyaDuCaNbt1nY0IHdwWN
 WvyuOLORsTlBn1ijy3gT7qrg==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Oct 2024 08:22:14 +0200

Add jump targets so that a bit of exception handling can be better reused
at the end of this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/pinctrl/pinctrl-th1520.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th=
1520.c
index c8d2ee6defa7..8556dd6b881e 100644
=2D-- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -464,23 +464,18 @@ static int th1520_pinctrl_dt_node_to_map(struct pinc=
trl_dev *pctldev,
 			if (!muxtype) {
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
 					np, child, funcname);
-				ret =3D -EINVAL;
-				goto free_configs;
+				goto e_inval;
 			}

 			funcname =3D devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
 						  np, child);
-			if (!funcname) {
-				ret =3D -ENOMEM;
-				goto free_configs;
-			}
+			if (!funcname)
+				goto e_nomem;

 			npins =3D of_property_count_strings(child, "pins");
 			pgnames =3D devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_=
KERNEL);
-			if (!pgnames) {
-				ret =3D -ENOMEM;
-				goto free_configs;
-			}
+			if (!pgnames)
+				goto e_nomem;
 		} else {
 			funcname =3D NULL;
 		}
@@ -497,8 +492,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctr=
l_dev *pctldev,
 				nmaps =3D rollback;
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
 					np, child, pinname);
-				ret =3D -EINVAL;
-				goto free_configs;
+				goto e_inval;
 			}

 			if (nconfigs) {
@@ -531,6 +525,12 @@ static int th1520_pinctrl_dt_node_to_map(struct pinct=
rl_dev *pctldev,
 	*num_maps =3D nmaps;
 	return 0;

+e_nomem:
+	ret =3D -ENOMEM;
+	goto free_configs;
+
+e_inval:
+	ret =3D -EINVAL;
 free_configs:
 	kfree(configs);
 free_map:
=2D-
2.46.1


