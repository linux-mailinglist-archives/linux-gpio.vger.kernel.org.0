Return-Path: <linux-gpio+bounces-4951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF6893419
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Mar 2024 18:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67D34B21002
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Mar 2024 16:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70567158D87;
	Sun, 31 Mar 2024 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDYRHKqH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8AE146D53;
	Sun, 31 Mar 2024 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=62.96.220.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711903259; cv=pass; b=LXsMnrnI1uvlIoVeE6kfolEmycgb7BZFMid8GTWoUZ/O86YF0iKn9ZrSjVPPyAaCRp/JnFsv43eP1xtxWsos0l1Kz/uoMTDBJ73s2P7BC/ChmPiRG2Ak6E7HfRcRtJ1IQSQ/SXHJHFGlZgLmrcLIRmDp1yOLamXuWItq3JxbF7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711903259; c=relaxed/simple;
	bh=jpeN1Yqiy86IASrMw5IJ3mejJAeGCwK9WF/sWpjQR4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uB+wKYWROU9Z0vUeHrY4kx6Ipu3gRVa7TSSH7ndG8svxfZGpERmN+ZAcJrAxT58dMSRUQex0HpGZM4Hfs5+U5NAef+cvll1JAfKyrvBeHlRgLG2V3Gc/NKB/YQjTAUcB/PnFdD96OW2yehHGPm8HnDGQrtkV/0PNFaVdUQewoE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=fail smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDYRHKqH; arc=none smtp.client-ip=209.85.128.51; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=pass smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id C30FE2082B;
	Sun, 31 Mar 2024 18:40:55 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rpALt8aPQOr; Sun, 31 Mar 2024 18:40:55 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 02F3A208C3;
	Sun, 31 Mar 2024 18:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 02F3A208C3
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout2.secunet.com (Postfix) with ESMTP id EA16D80005E;
	Sun, 31 Mar 2024 18:40:54 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:40:54 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:37:05 +0000
X-sender: <linux-kernel+bounces-125885-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com> ORCPT=rfc822;steffen.klassert@secunet.com
X-CreatedBy: MSExchange15
X-HeloDomain: mbx-dresden-01.secunet.de
X-ExtendedProps: BQBjAAoAVmQFfe5Q3AgFADcAAgAADwA8AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50Lk9yZ2FuaXphdGlvblNjb3BlEQAAAAAAAAAAAAAAAAAAAAAADwA/AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5EaXJlY3RvcnlEYXRhLk1haWxEZWxpdmVyeVByaW9yaXR5DwADAAAATG93
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 10.53.40.199
X-EndOfInjectedXHeaders: 9571
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.48.161; helo=sy.mirrors.kernel.org; envelope-from=linux-kernel+bounces-125885-steffen.klassert=secunet.com@vger.kernel.org; receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 2CA1320520
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711833000; cv=none; b=A3WJTgZOcw0pU7B2l+uyyNoQP9d9t42yjAOSpfXp8w7hpEopwQicSgHiuyzSg3aafZky29V9MI5Xn0yD6DdAsoo/klI5arabEJ6WX/XpU2Lqx6KvesU+sG2nAvm/rmyuT4cJ3r0HTGfOwdsaxNulvmRbtx0JeZsau8q/3hY8d1g=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711833000; c=relaxed/simple;
	bh=jpeN1Yqiy86IASrMw5IJ3mejJAeGCwK9WF/sWpjQR4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M9m6TGFNR5aOHZVKzB2COxCrCd1MzK7Oz1A1MLHmTM0SHcDb69Lyn06uecCOr6cpjQY5+ZPC4m26vWrKUuyTSH0lCrzOkQi+ipObkV4CZ5lJ64RqB8lqtoO2S7Zqz1ff4b2gg6olVhlPBoPHtfiLJ7kH4BCM4uiFB2rJsCbZct8=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDYRHKqH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711832997; x=1712437797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFZ6AvemSHHbcptkzhx+Eo5vulQUyGFEmtEeYrKTAdw=;
        b=SDYRHKqHgC8sVL3OuWEyFHNfmVwVLU2DiDCA6TS8+9qshlNe6rE9veV3ziGHMMl0/q
         10KaSpr57Ochd33Li73lI+QqB8ZDDwqA6lQ4FPgv+qPMkHjLEleWtZbeYD4IRgvJK+Vc
         Ktxfye+CWgeX98pyBHbrydYN5WiDYKbCEc9vnvFmkiqBHWqDW0ZLrD6LKi+qvAUP51my
         ZdNFPkjapRRpjmW4+sFO+BMh/KZZtF9YufL7msB+ILKL94znr0TsclsYbHsZ5mjZlFxx
         QNgSM1ZTP8TkXQU0SQQLm5fcIBblTo95SCPAosN4SMu6l8CDZl9iYpRFy6CZQzAg2A05
         CZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711832997; x=1712437797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFZ6AvemSHHbcptkzhx+Eo5vulQUyGFEmtEeYrKTAdw=;
        b=gNWQIhOLopaadm5LTqeWKd5UdffjIG7ODUstBEe42DfHEjR3EDdpmTW3aqS57FaRfF
         mzLwscqLT+2YKFbIHBGj8Kwb+amrPFc8yDnSoGDWJNG4RJMkLhSf33WeqRa3qoPmEVre
         4VUNKxQyC0tTu7+qmuyGG/tBkH0Oj7t8fFRW/bO/3u80c2Ob8PUWsolNKjEeGps121Gq
         nm3+IgCerS9vy1eqXemYFeosMbTTw5vOPsT6zF2Ex44fJTyjcGRT4fUc0dsUpYjrzzOS
         YfwlhOr+aYYVIszbVAYKeiEcpKzLVljgNZZTbWgAI6/JGM4KFcGNJrgLniqB87NntBsi
         aUCw==
X-Forwarded-Encrypted: i=1; AJvYcCVYPkQALvd+UA/GqQfESQEH3tZlWUxanGjqxgCiGSWtBazM6SiLMR5Z6Q1MEXgqaTccVVn4WmHtL6Ac1jGrCA3hUA52n4WKicZmiVfq
X-Gm-Message-State: AOJu0YxQCDFIOyA0qllSJ2O+kOOiArNX38j+TCnfyPPh3HMFgdoqWveh
	3YK4nh2tybGKABstyZrqsMlb7r4GwcC55z/c55Y4t43UDlZUe3U4JXUWb3ZBEvE=
X-Google-Smtp-Source: AGHT+IGdfuyJzSIxSkkcrfLi5TlHT2+g+ykSm6cJanYYnEITTKeGYlCFJjitdO5Wziu0DGC7W0P2jw==
X-Received: by 2002:a05:600c:5114:b0:414:1eb:301a with SMTP id o20-20020a05600c511400b0041401eb301amr3461429wms.28.1711832997494;
        Sat, 30 Mar 2024 14:09:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: sunxi: sun9i-a80-r: drop driver owner assignment
Date: Sat, 30 Mar 2024 22:09:54 +0100
Message-Id: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

Core in platform_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
index 919b6a20af83..5b4822f77d2a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
@@ -169,7 +169,6 @@ static struct platform_driver sun9i_a80_r_pinctrl_driver = {
 	.probe	= sun9i_a80_r_pinctrl_probe,
 	.driver	= {
 		.name		= "sun9i-a80-r-pinctrl",
-		.owner		= THIS_MODULE,
 		.of_match_table	= sun9i_a80_r_pinctrl_match,
 	},
 };
-- 
2.34.1



