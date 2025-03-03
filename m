Return-Path: <linux-gpio+bounces-17071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C653CA4E8BD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 18:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FD35179773
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 17:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83F028FFCE;
	Tue,  4 Mar 2025 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A3W17pDj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD7823A995
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 16:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107579; cv=fail; b=ZHC4Kb8uOH09jyuR2U7XpVDpN5G4XPrzsc1OuARZg2nOc7SVnE1OuP7Q9TToNubXALwBMthIZp0z8NF2AchxwrdyvX/yFN/j8ToA0XLi18aAetfRjGoM86vc/QxxXPjSLGEapO1DztHCd/h5UBjwPxMIsfh/EcXj1UznxvO6UdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107579; c=relaxed/simple;
	bh=rn94O8yIbk8y8eg6VItnAJsHew9j8s0CC32dOi1Pufk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c0KG4SdpGfEcuMWDncOyQlUptEpoGWV9bcn5wvrgtxBhcRvwSkcwgS7WhxNzrRyhShb37SGA00B2FgVMglr3D3F77NIvj4vakaAF8UqNwRYA9wLBK8WuiAUdreC1JjZtrWeIXYd925NwrZPenM+VhVpAT0BCo2I52kJUqkPKiCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A3W17pDj reason="signature verification failed"; arc=none smtp.client-ip=209.85.128.45; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; arc=fail smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 7B84240D977F
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 19:59:36 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=A3W17pDj
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fZZ3d9VzFysk
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 18:23:02 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 30358400C6; Tue,  4 Mar 2025 18:23:01 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A3W17pDj
X-Envelope-From: <linux-kernel+bounces-541165-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A3W17pDj
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 6BE2042A3C
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:35:14 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 28A0A3064C17
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:35:14 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8843C168E2F
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3811EDA37;
	Mon,  3 Mar 2025 08:34:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189B1E9B31
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990891; cv=none; b=eBUV59Gbnf8wa589Sf3ciedMVW/G0pBivzx9uJJ7/oPkKAGa8aRG9D20/mu1UQ6cR+ZmV+xKTXJ68Jsf92YYTFjGBS8CvfLm+m/hHNQfkiZowxaLAGvEaxf3j22J/wa2syv4WOAAIdHRdIxRw0Nft5V4nPcsNRShZzu5NJmZu8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990891; c=relaxed/simple;
	bh=iPFuGbLFPQtPqFzwDENkWUAO61z2GvV5w4cvc2a+t9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMCbTyX3p+3cXwr2XFA+cZrqT2lWETyfF49x2b0UKjnn43oM4fGOpu+vPh4hO2JCCHrFbsb3vEIaMyt2l+KCDcCJzOTRmE4OiwqWfATSinesTCF6Q0//eAgn5/eqtjDaeTmOFuFEa82bor974w236x2vaWgkNLAdVs/OqKGYq44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A3W17pDj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so2132915e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740990888; x=1741595688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVro2GWwNaGJu4kXC9WvdopNSLCVYlzQ9STaoYCC7Zk=;
        b=A3W17pDjYKhgJfA6mmgrR6e1GbMN1Yv6AGv6PlN1rzfHZyMjL9MUnxJrCAif3F8iPg
         Ngmmh37O6E8Rz2NZeTATj9quKGUNci3fpFf59h/ZhLRHPEeBZ4O6+ywJQYo0rKpJ2KPg
         FGtusYDHeRtGmZGJKY1VVlBHNd5dPP3HcFKywtohSPlbW5PkPPWcW5IVdBljCMdlFnbH
         v/A+Qs/9sretcTS7QvpT5axshEI6E/rZg68q1h6WZWs1hB4TOwwvg6ywHDEV1Amp2ckm
         xxQSNOoyu/RyOGD0S+zigJW+RrBG87bj/iPkbbnkaEJptVcM8vCKoNbX8h6xbR6t2hEt
         +Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990888; x=1741595688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVro2GWwNaGJu4kXC9WvdopNSLCVYlzQ9STaoYCC7Zk=;
        b=bUFr/vwykvKu0iSqv4DXjY06kpEQzWPbAJnWTGDbZV4ebQCyVFLt04c/9Heps/V1ts
         mdOwX5gf10QyuGOMJfZAswu32PsFqwQNdxAqcp8sRhU2FnUSijqmn5vuUD/suGoeCmsH
         FcL4CjUa3VTiLbSXtAVom1bVW+OlGlPUj8DRj1ZazB4ZWDDsKJD6Lpir/ZZhnv+3a/L7
         Mv10RslDlSvMiIDMabNJ5dh/0Ffw4AMMgtOhAk8Yq4BrxLuf3NCCBsBtpCOJZ2RSKu1E
         kI88GW7P9EnXAzQ0Wru1RBJ8xDGFfxKSt5wZn8DpsDocD1pDPAGDFsvA+gZGDB/IXkN2
         q+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmd5HU6A2g0Ls5tncu7mf7T51I2XsdOPICRRdREzFVrUJj6Qxv0YC0uA8V8Mt01O03vSarLEAvr2wcadI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK7wDT5b8iVsbHg5KxBldHrhKtVTngo40dPJE/TnDMQ1eJXzr8
	EuZqlFVvTNxIORH/oeQUkdug4q/HDxO9VUgXdXtctxo1gLXlnY6v5Xlhl2MP2PChGJ8/5JzpyOh
	+
X-Gm-Gg: ASbGncsrsdCn2m8VBXcJOY2ICB1LxD4K3Z92jVH9h/E68pJNRQ1WtI8a80e2PWV85/b
	fk/KYqTj8mlFfp4PI7ezelWb4j6ZR1qd3AL2sTGp7/v9n++w+yZgqEQ1k33fFX8YLz4HJSfUwhJ
	oGu30eokVvejcru3Rv4h4Jq6A6RnteDpP4E3WQs2JMaTgcxEb/93Tgpa7Cxn27nekeOPZy9O0bM
	P36+DWx7+2W6RxUQeXFgZxBSRKuiJ6RW5JRUkqHPiGsiXdyLUxWGstRqp+hnRc1IKBTud81kHJq
	NkO8MfkZiaCF7OVvGDbpftLhM/dJvDS4PPZVg4mEuaIt
X-Google-Smtp-Source: AGHT+IGT44pwTNA4nyeYj9rXZTnNHuMSqOpa+cLk5QqeHHwy95CnfW/yr5rAJr2fRMGTOGMJKwU4KA==
X-Received: by 2002:a05:600c:a4b:b0:439:8185:4ad4 with SMTP id 5b1f17b1804b1-43ba6747082mr94929085e9.27.1740990887605;
        Mon, 03 Mar 2025 00:34:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532ba6sm180406115e9.12.2025.03.03.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:34:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpiolib: deprecate gpio_chip::set and gpio_chip::set_multiple
Date: Mon,  3 Mar 2025 09:34:44 +0100
Message-ID: <174099088185.13023.4679489992150652346.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227083748.22400-1-brgl@bgdev.pl>
References: <20250227083748.22400-1-brgl@bgdev.pl>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fZZ3d9VzFysk
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741712262.3799@oj1G3TrD3RLBbIyCx7zo+Q
X-ITU-MailScanner-SpamCheck: not spam

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Feb 2025 09:37:47 +0100, Bartosz Golaszewski wrote:
> We now have setter callbacks that allow us to indicate success or
> failure using the integer return value. Deprecate the older callbacks s=
o
> that no new code is tempted to use them.
>=20
>=20

Applied, thanks!

[1/2] gpiolib: deprecate gpio_chip::set and gpio_chip::set_multiple
      commit: 6224e7fc1ce75edcd03b56a2e0fd4c1765d5888e
[2/2] gpiolib: update kerneldocs for value setters
      commit: 9778568dede2166c7bd124d473f9ec365f782935

Best regards,
--=20
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


