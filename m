Return-Path: <linux-gpio+bounces-15748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A222CA30C50
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF7D73A6EFE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C6C2206A2;
	Tue, 11 Feb 2025 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OyKZzO6v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42721C160
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278790; cv=none; b=temuNU0VJfu0/Y9ycZM1Vw7FYHd1KqfQ6WY4xJGyHQjW8+UiJj5aix2xdrxF1FncehETc0YGAchsRGqr/cO5bF28ku0677VIn2zXigbuRoWPicNx46O3H0q1j+zWF3uAJeVDRwIG5tEvt7MUZE60dzek/I8u4/qvCgrItTHyb/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278790; c=relaxed/simple;
	bh=YlPGh4pmtCOE7xtDJOAWZkfON+rqq1FB9jCLbTzmsKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pg6YIjlEAVz97xhy2avawpZ5RA4pHDPx8N1jy0Iywoe0Lo7nIMQeoyIODChbsNdMdz8QvPffyQtsYZLmWRchepoKmRY8oRsuAtEbkGkeP4+W+S4FZcrH8JIBltlpE3ufa/qo8/hk5DNL1UdQz8eRSwOfi6PdQOrCfxWwOKCRogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OyKZzO6v; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso32724385e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278787; x=1739883587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd1C+vo1v2WCKXm6pVEB5dHLGqFhuSBFksocLigcO0c=;
        b=OyKZzO6vfexvi1okZNGMdUL+5VTl9swBzquMQ4vjA+Occ4ElzF3C+9lCDVV3BlD+YP
         NK9esWVcIf2uFdq3br+Us7K4kZVmFU1vjwamYVMi3v1KCh/Y2jBCj0ArIAcezMjw/X/9
         ia2uMAONk0DbIK26OD9te4o43+iZG2UI9Q8Hadmw0WOASgtY1vL2XPt/sL0ZX6LhKzaQ
         yKR7+QbAywyyr5wJgd8waZQ66LnrzkXP4UT0mr9VKaqFQRQ4leVV4V9t1V+Q3NaBjEgd
         A80EWKgsL7Q0InFBqE9lyqPpDOfg0lDAXdbX2nYkvh2A0Dv0xSs3QRnxWZsxSDLSNeF/
         GWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278787; x=1739883587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yd1C+vo1v2WCKXm6pVEB5dHLGqFhuSBFksocLigcO0c=;
        b=qZVZlzA5h/ffrH4nTWLPvmBhsE1s5S1h5g2+aLKfkpG2pGCHxmo+3Tk9IQbcUiPHae
         HLTjOOECUSi7Xs5SxTeemmwW7aPMVOqQxBPHyFbaxSDfifXlYp0gO5yFOIR3x5DdZtt4
         hvzCG/YaxDp7C7u08IaWTQnHs03OkgMzPXrfbGJVZGTFpAHujo/FVzcv2qHRRKsh+8lt
         T8l6VIwyFlue+Q8+S5gg8blNEQST40hKx1UorcELYGXiDdq3hds5XmiY2QP2Sll+ZFsD
         dCACEzhaKu/iXwa2p5iQtRq3l+xkBlmA6h375ZzUOV8InkKis0TC9m6kyHhe7ktzPBZO
         bSkA==
X-Forwarded-Encrypted: i=1; AJvYcCUKn+4SOS80cLEbCq+Ihriu9t6vyY0AR4mWY/7+EODbDj1yxr0hLysuWumw5QWBXQ94IYsJwbEE/6Vy@vger.kernel.org
X-Gm-Message-State: AOJu0YxLrHEVlYh49prm5VigdhpCJR28OzJFCegFFKYroDNrXIx8t7En
	oExgY94beBfZTawy4kMn1UxsNAcFY4P6aRJ4NH00qGeATWyPSYngrsjQxIOAgZg=
X-Gm-Gg: ASbGnct4evNXtKxQ2PcIA1+M/LqlEzbSB7Y4ECHixNCnXFuasOargl4Tcu8YZmBRins
	JqlfUa5hNhi/LukKTTlwk8sBauSLWUIKltvF4puo6lunbaqT/Lqz+VkNm3ydJQ4+2ReUzcHL0jX
	//vg9l1b3IiYeXYnJpjJQZqd930pa8EoF2LxA0vUPNAZ+oU66vkTgOiBBLxmivX+75Kl3P+q1w1
	5QhT3QPNhuqImD37SJIEoicKBRT1m5UxORVci0IG0j15xOGX3ajXeTkRiFK5xWSN+Uf2t4I5wzp
	o6IpBSY=
X-Google-Smtp-Source: AGHT+IFCq9uaaKsPGro40XvGPjovM65iZ2iynRNpotXtF0MSl8eP7kJuq6ebatruUY6sdGUeyOtjzA==
X-Received: by 2002:a05:600c:1f0f:b0:439:553c:2a34 with SMTP id 5b1f17b1804b1-439553c2b7dmr20004555e9.4.1739278786815;
        Tue, 11 Feb 2025 04:59:46 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:30 +0100
Subject: [PATCH libgpiod v4 09/17] dbus: client: tweak help text
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-9-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=835K+mlZ6UrS6q/DzaKsErP0FTSHQFLlFsXsvDQEKrk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m2u5pJngcNkkhWLfm/nH6w9WfwJSSoDj31M
 DumKkb75uiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtgAKCRARpy6gFHHX
 cq1nD/0acsavBDPLspI+hgxC7uQgeJJOu3jwYmjj172TjOx//u3De+so3N2Az7qszrfkaent1mR
 c/IxVK1WWxfjrfVtWsyBCCjb3aZzODY7nrgqZe1H2q9QYbYv5RnfYKw0mZcszS86t4xBnNm7lpO
 sdj1C+k/iWR+eEIjqytn7vS6sAVhJcIWvsjogaXJhLXIzG25jAHDMcWX5CfEaaPlV2ozLQuQt/I
 ZfvkovldsDOjOk6MW69RgQSH/Liw03KFtHT0/KJnOTWrfJht1d+BgXULSRCCrl/kl3XYXoW7jAJ
 TIW1TZeEz93+NQ0v17Q3M2ARYsMTyHphFX0zUOAOaZAhFePspwkfLRE3W8RHRGW36Wj8Lj9Lbox
 llpBIoSNM1bLGmKX07L/nbFPkiHN5VahsdGp8yepKkHYjY28jik9jOQ845/vDYkCMO8YNcsDHNh
 hfAduQwgAjE4TVepKvLqmlVD1Zci8afm+pa3F9g+DzHzx7XKJhPqt9IvkpnaIj5lppsEz12zUyo
 gXDgVwvrld2FK3JKfxLCtDv4i8XfuGFI+ZRJlRi0iGyMcAY1a4TLItt4CVEoMuJfw+YQkMsMfqa
 C2QDf+NsntMIujd/4nko5hSK6rypZ2yj5zTS6Ll+89pjvLEPkZOEtBxHsgbUxytcRhSk8cAgR3G
 eIGSwvmfbIK31HA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

help2man struggles to generate correct output with current help-text for
the sub-commands section. It doesn't break the lines correctly and the
resulting .rst generated with pandoc looks just as bad. Tweak the output
a bit to generate better man pages with correctly broken lines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/gpiocli.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dbus/client/gpiocli.c b/dbus/client/gpiocli.c
index e9ab380..26d641b 100644
--- a/dbus/client/gpiocli.c
+++ b/dbus/client/gpiocli.c
@@ -107,7 +107,7 @@ static gchar *make_description(void)
 	const GPIOCliCmd *cmd;
 
 	for (cmd = &cli_cmds[0]; cmd->name; cmd++)
-		g_string_append_printf(descr, "  %s - %s\n",
+		g_string_append_printf(descr, "  - %s:\n\t%s\n",
 				       cmd->name, cmd->descr);
 
 	g_string_truncate(descr, descr->len - 1);

-- 
2.45.2


