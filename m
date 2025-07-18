Return-Path: <linux-gpio+bounces-23445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9C1B09D25
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D3BA848CF
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFAF29A327;
	Fri, 18 Jul 2025 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gi4GnIon"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A32989BD
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825388; cv=none; b=fCshsTm60ZcN2kSqgQG8sXd/Ws0KwsKSM+zivQ+KsYbPQlJMBIdR1lXRea1cxrNFH9RZIlduH7nTqKiFccIcJE/w9bu80m19ZGHXk/SSYRVV93q7m134WSMKOpkqAWbkZdOAIFE1ek0hxuxgmzkBjjPd6MEtl4dG1qA+6CTUqyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825388; c=relaxed/simple;
	bh=lpm2+edJa87Cx9epc57JEOOqNv1u0nwKEPrxDjWFGM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B5w4la5vJGrRqSNTKMbFLyUzL4aMB0ahWp+z2OXKJP8twU2ydDipouM4RzY8QBxu/u3QEd3Yvb/85r2UZKqUx7f5TERSPZbvgMVm7pdhyYMu9wJMCHhJxA1vomcjopYGgMyysTzXKEo7COnH7b6GiFSqRr2pjp7en9O63VxUt7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gi4GnIon; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a528243636so1113641f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825384; x=1753430184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c8fdFMr+UpHuCUTudUkRscMjxr1TXKDDE9fIOozpk0=;
        b=gi4GnIon/kSSt7Fr3XqPhEGqEv2lPFCioUK/D8CosdcEYAnXbmRNqeI9uEK+Mu4qoV
         5+/5KrIi/A4dCFxVf5XC+QnnJTh2suLl9t76JKQLzNcVFjFrOLCyFwK90nmTeOwpjaS8
         JJ1U7qfGc+/+wsNwlL0WLZ4MlyMwId0UeKG2qTZlDNeEZ3EfPXzTMziTzLX8aUzfHm1f
         dSyZImwyEoW5lfp8AMcgrhXU6KKrEnOhanLSg2Lvw3sSqF8oCBcFuHhzjxxMJUeoYoMZ
         Ck6KnMkmEbkSku70Z5B96SNZilXrY3ZdkMfJz++j6cq43+goS0Ryb9snB2ADCqWxA4M7
         o/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825384; x=1753430184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0c8fdFMr+UpHuCUTudUkRscMjxr1TXKDDE9fIOozpk0=;
        b=xL2rVHG2PQlNHHF2n0QDnELCXg3L92JgMckgsxfEXXOB9z/U5NC8Nimwc1mvqR6e4U
         PjDphrNy7gyvcEDZpOT14g1j4r4HEukhRn44ijtie+7vTbl4aW84/UJtYIb4DVm9emUM
         ttTcxDXOMSR+dfJp6Fk0ZDtpbSc4M0NJqeh+Gm+Mtnf38KZBPc8ezpMTfApc4ZRA/Stb
         WNndMlecnBJboL6A28CxIv1qJHhPYM9CsEI7mL4jzVUecEGyyM5Vv5NFQjLG7olhtBjg
         nmFLwlB936YtW6hmWb2TanHckfh4+LQ85a+82ZhuNTgwMTA+aASKtaqY9/WDAfrLoBUl
         5yHg==
X-Forwarded-Encrypted: i=1; AJvYcCV1+5WQwvFDrdx/pRqJWU5KjGCY+oCVrZYIEqtofs5kjM5muV908RSrzwK0nAsnak+WjdkUU4UI3D6K@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJqJxhREHpK1Su5H1U0nWORHWiIT9j42SZXUyByq/JYdaz5fP
	aUNp6RaTa8cnQrAN7m83EwufmnvXKIP9o8yn8CKGELUyD71aGKqq+ofud65UlU3Lb1UU5HF5TLZ
	M+rtOB4s=
X-Gm-Gg: ASbGncsZWLz/mZZZutVgcX5hHH/DQ6UNszJZvu4zACMl7gE8z7uHYM1e0Yai2vH6TsT
	g0m+UUWdjSoLOnhFmVrRFQ9MBULKCxXBwNxE/JCaW87RRseXo+KBaWfjTSL5PyqvMIJG0Azfhm+
	HwfxAeKbliVtM5Lx8lkVpzh2T9VabWCJ5p9Y6FdkVmGmDS3IqIuvNxFA6qXVkDyKERZEIte5eA9
	8NWHyCIRrFiVgNU51ZykpgYltvOkSI0gMAVNW3QnZrgejiuXiZK8YId21dBG3k5b+8SMKUhP8UB
	IJ03bV+XVR+pE0TNScs5dtgASnWMlYc2hvrmAs6VJf7tMKzxcD4Pmgizqtmf277BM0uWyTBirG+
	QQ6kDD6hQePSD8RIQQAyO
X-Google-Smtp-Source: AGHT+IEEuT+p5IKgXfqrVBFf6P2douSPhQsT/o2MEkjNdOPlGK3LK33AdLMJCbwxmACcgn2BBprRQA==
X-Received: by 2002:a05:6000:2705:b0:3a5:1cc5:4a17 with SMTP id ffacd0b85a97d-3b61b22299bmr981616f8f.42.1752825384413;
        Fri, 18 Jul 2025 00:56:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Crispin <john@phrozen.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert lantiq,gpio-mm-lantiq to DT schema
Date: Fri, 18 Jul 2025 09:55:54 +0200
Message-ID: <175282531513.45055.16088789806778358341.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202837.3011521-1-robh@kernel.org>
References: <20250714202837.3011521-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:28:35 -0500, Rob Herring (Arm) wrote:
> Convert the Lantiq SoC External Bus memory mapped GPIO binding to DT
> schema format. It's a straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert lantiq,gpio-mm-lantiq to DT schema
      https://git.kernel.org/brgl/linux/c/71b660010bde67a0e0ffdee67d30e62672e6d393

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

