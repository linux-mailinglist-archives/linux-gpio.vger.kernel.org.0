Return-Path: <linux-gpio+bounces-23437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292FB09D0B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7E11C27D65
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D65293C5F;
	Fri, 18 Jul 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O4HHZxcK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738D292B31
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825380; cv=none; b=Ai+KBcsm5CjlRPTb8WcFhhLMBZdGxE0NDF+pfeqSGeSVMEtnoDEeK9WIbKHIXQE1bCsaiiGLN9HN8+Bqn85XUZYxSsdjO69RmJBxPoG9+4z3OEmXDbrc6tMVdWwL593aRYZzz4SvKoJ+8Ny/+mV3Cp+bQ6Py2Eo9cQqiL5u8cLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825380; c=relaxed/simple;
	bh=AH8gj/lye4cjsag6tkRFASwBoNl2K/FYCAB1SRwBtOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExxCvjQDkP/99QKPDNHVUXmEm3AeEr/npiXzi/QsFoaxtpB+zTpBFlyAl73iEzKyXEPnHwLaNqKnHHMAHSt+03x+LaJauveSIcw5+NHShRorb1qcTqOaVb/jwl8fuPUc6QVAhu/PoxCI1jLBgFb1xLSyENoGbbWj4AiAi3x0dco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O4HHZxcK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a54690d369so1446036f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825375; x=1753430175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZToTQ8PW4JsaMkDi4L5ivDoGiP/EegAxDULuwZK1b20=;
        b=O4HHZxcKW/6Ee12Nk7mLV8uQ0Wn//IL6MRZmfOWMC7TSD9y/wlFZ9Lfxn8hkyTMx7E
         ly4MZS8Ck0edLC3R8nx76wPTAkqrL42wHToQkeT7fwk/+lNVJ4UqGBgnILM1ynfVFBIN
         OEZq0YpnavNyOfc6JGYnJ3outvBdsHh9EDca2g8E1yAC8sc51lpn5ixBgtjmEAF2/Esc
         wZ0/tbgB9mpkMOlMedeNHkiTuYnaUOWjsB8qxQ95rUmGSDeXgCvksF8srk8L8gqjIvja
         T1h2fQ8amNhCrkLLVfYznMt9j3YB+kYwLMsekvhari1/fY7zvqZQA9gpoPtx7wV1G8rM
         +DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825375; x=1753430175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZToTQ8PW4JsaMkDi4L5ivDoGiP/EegAxDULuwZK1b20=;
        b=PD55/QjoCR69IAIVDfE6TB+fLa7ZS8LZS5mUy0O5teZzVCwzvAz0xkG+EX+l82HVc+
         JfEVbQYcLAecPLa71zDt6HgA9jfmuiATR5rEH/r6yxMrA8n1e7Qm23K+ZIM4kgstzAzJ
         dc15v8FQsqOnB11RK9jZb1e3Gu7d3EGSzjA4VA7k435S8zQTPmcGllzxjxyjbvI8YFxY
         FSWlKGeJRRQ+qaRBr9Q+dvXnpEFsdyrm9d9/o9081SBr0yVKdmyEn5jJVgkrnADz8SiF
         kYe4aPzIsx24+zxxd+QFLwkyS2fGVw2SSN0IR4oMwZ6RXzz4OeNbZqURajTaDTmNUGgQ
         QD4w==
X-Forwarded-Encrypted: i=1; AJvYcCX4RyEtfJv6VW/Ah0xtAmiv5inc368eENkzf2HkarVTq2ihoxT/JYECcm0N4775Nw8nazbi5tVQDGOI@vger.kernel.org
X-Gm-Message-State: AOJu0YxPCDZseybGsNBqY2HJoqwp9bAtP96SXWOMlG2nqatzOKgOqcb8
	91T55Et4XJCbEtkJF2nsfzr3B1bLzjOIMYtG8DVctpxk3LI2aLfLYLTjvarEPY5NijU=
X-Gm-Gg: ASbGncvN0jGci7Qz68Q+hQZuTL+Anytm+IIXFuBsSlRBlhLsAISMjtXahb645spWvYt
	+zy29tzO1h8QLQ+BqNuInihWz5l2sClQR9/w81Ca6gijqNehh3lq9OkmdKozZkXaD8w/ggg9TVw
	Jves2hQ/YbzHtndH9I8dElB5n5yz8vax0tSQ/A0x938HoeL4SrIz41Zrvo6uoYFicY4JBQRW857
	4B6OMBGN47RKQ7nUP1clg2/HNPMtHszqlX5qgjx0MgCUzFPXOeHS69dbVzdDkDSl+acH8809ngn
	e4FhkI8YwQ/8ZUxKAjUXB/xEONxqz5H22Y9Cp/F3SVW1OuyvtRDxr01fTtsxzA+5U+m+xp6EBG7
	a5g/0KArknT0jeQmjFpLa
X-Google-Smtp-Source: AGHT+IF63wZIgbHIjDHSteYojloqPMvMUL5Da8SVDOUi+uUHbZuSXcpOtHDDBRVodn3nB1iist0iMg==
X-Received: by 2002:a5d:64e9:0:b0:3b5:e084:283b with SMTP id ffacd0b85a97d-3b60e4c1e2fmr7838667f8f.17.1752825375521;
        Fri, 18 Jul 2025 00:56:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Ruppert <christian.ruppert@abilis.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert abilis,tb10x-gpio to DT schema
Date: Fri, 18 Jul 2025 09:55:47 +0200
Message-ID: <175282531514.45055.4499067354058389239.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202934.3013189-1-robh@kernel.org>
References: <20250714202934.3013189-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:29:32 -0500, Rob Herring (Arm) wrote:
> Convert the Abilis TB10x GPIO binding to DT schema format. It's a
> straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert abilis,tb10x-gpio to DT schema
      https://git.kernel.org/brgl/linux/c/dedb4dd925ac8ef514391adf4267cfcbd4f27ff0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

