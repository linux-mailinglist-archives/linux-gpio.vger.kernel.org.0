Return-Path: <linux-gpio+bounces-7045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 328388D7D4A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4D0CB21E45
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2180958AC4;
	Mon,  3 Jun 2024 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mNRUEUJv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA9381CC
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403147; cv=none; b=MsDxiq/ZgJPsTkqu2BPe313je9hXVZyF6zQkcoFCP8hU5gy1MyByedAVx3q6w6iH9TFx7CWs9kYOteE9ifWMcVxvoNy7Kf5NRQCG+QtmpS5GBhby57HUqHkkcV3I+qCWToIm2aJSsvH/bsnb3WUR2OOA1zAZRuGRbqqOjt4Tt38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403147; c=relaxed/simple;
	bh=nMrzAHRYbaM0CPzFYJoIrikgtExLbpIG/tDhr8hm/0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ujxniViYnT1EZGYbx4J6Q5GuKMKSQjDDr+UvCvTLNXcReDzHP9f39u0Sys3JtEvnUaH+feOgQHReojXmSozsqyEdF7McrJXKYbfWXPj39OgbJKH4ioCZEzAlNFLR8BpB6kNxmkQEyX/brTkobsEABfhmVNmtdwoRXGNrPopDGCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mNRUEUJv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b8d483a08so2700638e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717403145; x=1718007945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvxlVn3WbqZZhkrp7NY7W//mMZJXucYwAeoohXFNboM=;
        b=mNRUEUJv9A6mykWnpIHQ2HKgXAx7PojPFI8yLR+nFUGOh8qvBDhbHrb7li9cbA1MgD
         Iv9aBYEj2TDcWFzLNpWU/FsCmQWfsm6OW5EUn62ptHqu3dKlgCLZW4E1V5z4BF6C80aN
         ZBKtbnRfAuUNtKBtk7wEDk4Yaw4Kba85WSqvGiZuwM7tx9IOnc8CdnYvAEraroxszDNF
         +T9YvB6LOeTH43OgmCRj/qlfd/RwyDBtr8Fdi1QPxmIEozLQDYCC+hxUCyvX7wR6M/zg
         YqTL6UWBRi/cwogCQIZa8eBP/5c6Hcx+ucinb82OkIl2A0hx4Y/0ydO8ltXfHvydAy/0
         RpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403145; x=1718007945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvxlVn3WbqZZhkrp7NY7W//mMZJXucYwAeoohXFNboM=;
        b=gr8+9Yg8XlMwLFn6N9q32a36zaTVOhaeOj/HMKYGyD+7HEN8BjibdG4F60Wz4ctyat
         i4zX3RW9W6XHR3Ut/2ModzpQZ+0L8KRowvPGyyvPdT3Z6P5CHaJZBsNMk5/se7RI5yBy
         iscAlt6yEyhX2EiImkR7yahq7r6kAIpLvnvaZqmkjbv9RGpbsmZ7Nlm8oTf6BLCQUt1W
         c+Z4n0Wr+vUr3H1M76jwdjQIn3y4VYLSpD13dN2PKlw/yRMCsI2rwj+fV16fsPCkT4Lq
         VBzUY/HoxOLBjrFDMMv6EivNntfmxLNTx4/fnrZyCCRyb8Sa3iVCzUwWUyEUtPvB7RCv
         IuHw==
X-Forwarded-Encrypted: i=1; AJvYcCXPyU8KedhoT9NFH50pVqu+8tN2Q3uGpapahh26G09wy9djH7I59ObOcDzif+Kk7VJNo/260DtMENmNUBK38HKu0YW2aauHmQQLeg==
X-Gm-Message-State: AOJu0Yw2Z/6zKhmtpeIV6yLfwEHB+HPsIoBJe8KCGFvUiMsjuyJxFmmm
	5mtagRkYhKXHMHwrQvI5BimP08sVr512INSrsuYPRal0GtwvKagAcRSTw0rePa8=
X-Google-Smtp-Source: AGHT+IHvhGIL9bagwIEIWKklEMO2niJwNdydUNxk7jfjMiblsReyAbr8xDnjx9dhW5olJB7JFIJNmA==
X-Received: by 2002:a05:6512:158c:b0:52b:98ab:6100 with SMTP id 2adb3069b0e04-52b98ab619dmr2154272e87.15.1717403144788;
        Mon, 03 Jun 2024 01:25:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b84be78sm108641565e9.17.2024.06.03.01.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 01:25:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: alexander.stein@ew.tq-group.com,
	krzk+dt@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
Date: Mon,  3 Jun 2024 10:25:43 +0200
Message-ID: <171740314108.11298.15004161310238771393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531164357.1419858-1-Frank.Li@nxp.com>
References: <20240531164357.1419858-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 31 May 2024 12:43:57 -0400, Frank Li wrote:
> Convert binding doc from txt to yaml.
> 
> Remove redundated "gpio1: gpio@2300000" example.
> Add gpio-controller at example "gpio@1100".
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
      commit: 77e1ea9e9913df8c23ac102c9c2b7c49a5d224da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

