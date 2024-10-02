Return-Path: <linux-gpio+bounces-10716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8598DBB6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E5C283DE2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CF11D1305;
	Wed,  2 Oct 2024 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bkyL8vzu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC3D1D043E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879324; cv=none; b=EmVeFW3D6KR5LVpxL3D0cue32UaE0l0NDB8JOTkVK1TcHAP5H3pBfASRRVz6HbKae9gOSCWoQhcz6qw/Wrz7DbvadPCABoJiQ8Uly3q8eNnXjP75jzcWSPupyJMDaM4VqrnWTcBHKGRBSS2imdHfRWs8KbZypZDDUz5/DPtsWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879324; c=relaxed/simple;
	bh=0K2PjLzYVOXehuiL6dtcAYObtHjiu9aQ3DrAo/gWFTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ep0Eh6+K/ZxAOhPyUOabaDri0UTd8EnH+mY9HNvlQMmOQxExmxoG+pCNEGqJwZDtLLKUC35rrZeIa2sgCKxzzOWPZg0bLp/KHZCyndHCbZ1RXkXiH3+634r5Qbb6yjFYXcE9VCixTNBSmX/TaHK8JPFDLybZSYSqZYMLB/fdoLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bkyL8vzu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so30578455e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727879321; x=1728484121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ27fZvyx19AnkyD7wFd68TFT/kLyZp9eTFNFA/vn6E=;
        b=bkyL8vzu3rwY5HmdgLKpssFIj18ld1mN8XMQ8z7RE0r7nMxIlaE7MkNxUGyF93e+OA
         P7yl4cJqPIUxoyStZeB3BkAGNnnmEXq648Q7Na01aDMaJDI23mSllXB1cEAmWYikJEAI
         GtJ3dwHQtGudwF706leoPDh3Keq/glebwxAJnR2Iev/gCedm8G84/yxSGLZy7FFdhO7V
         vZ+/DNj3ne87SKxTgblTQ25XJrnFw0we7lrSkcqwQ/tGHdmtdZgBwq35t0hY33fLReyc
         ADA0FrxOBNUIagtXLcgnJoSJre70CpispUelAwoUhYm9UGgBBVr6O1Va1i73znCpyNXn
         cBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879321; x=1728484121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ27fZvyx19AnkyD7wFd68TFT/kLyZp9eTFNFA/vn6E=;
        b=qY/n3LjjpLvQuEEstsUzIObQ/2kaDGuyNA62Yo95RZms4SvHWEAsrfBdRn9G8sedze
         4i6340SdFWkMPSp5nfmVvZovo/0CTKdKZP0Cflr8wH4z1VCObvTY06QH8LhVyVao+hD+
         85DDA2dJogZMYADpKTJmp7FOrG9v87LdLLzIHiMUpWAL6qLiz9YvR6Mpmt/VwcdAwXta
         9BkOUJ0qkhKsDnjtBbXHG708tMZffyYicVs33/syFzggGzMNgGwdOcxAGitsiHsut/ec
         C9qcC+22bK+Dm2KWYL2cvpmkNFHG2UScq2qP7zPmQJnRBOAfmdDQy2+hbpc1qGlbhLmj
         B4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWHFzA+dBA/Grr8nnJRHw+NIVPxAW7ltTdCdO79z9u45T1WXkxLLUOX8btsnTey75HA3eoI0X3Az7Zf@vger.kernel.org
X-Gm-Message-State: AOJu0YwzixepWC+PK6T9BIXGYaD9mZuqR7P8S/7p4ZLK5FTX3azvn+2A
	Q0G3WvuRNcHq2n3jWvczFUSXLpEAHywFM+gJ8J8O55p5IVmWFr3kWnY6ymLUMEAMrLlGz/aqCSr
	0
X-Google-Smtp-Source: AGHT+IGmDRxvmGGzzd+LvWmxuVa4BCIIn9cWsbjCUfdpDhgz9vLCMpXY+029RQlssv7h3P6TqmP7Eg==
X-Received: by 2002:a05:600c:3b05:b0:42c:acb0:ddb6 with SMTP id 5b1f17b1804b1-42f777b7325mr24629985e9.9.1727879321321;
        Wed, 02 Oct 2024 07:28:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:23c5:7b17:f5a4:f41e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ff9196sm19979755e9.39.2024.10.02.07.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:28:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: st,nomadik-gpio: Add missing "#interrupt-cells" to example
Date: Wed,  2 Oct 2024 16:28:36 +0200
Message-ID: <172787931073.72515.12442051165419419116.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925173504.1906872-1-robh@kernel.org>
References: <20240925173504.1906872-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Sep 2024 12:35:03 -0500, Rob Herring (Arm) wrote:
> Enabling dtc interrupt_provider check reveals the example is missing the
> "#interrupt-cells" property as it is a dependency of
> "interrupt-controller".
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: st,nomadik-gpio: Add missing "#interrupt-cells" to example
      commit: 35c013ac7362a5470d5f30f3da0af50215095121

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

