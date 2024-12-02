Return-Path: <linux-gpio+bounces-13372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC549DFBEF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 09:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8747162A4B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 08:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E541F9A90;
	Mon,  2 Dec 2024 08:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XRJR2fQ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B9913635B
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733128268; cv=none; b=QBc4WkS0PdYYLOkdiQIrTPNiUaZ9bLrty9NYppuTnRdf3bFH9dIdH5fDQFNqYxv9X4RQJk01n6oD1pVgg2WNQDirGarVU3UVmRobC4pLqL30WPVBD8Ut3KDYyXp90DYsVd+oonIOMVjNDqNSIbxCGiAPLgWNOdt7dd6K7NsdSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733128268; c=relaxed/simple;
	bh=J41CQbXhpXGs/TkgJYtvEkFmiougYbhBmn+mJwqF+Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMOg70dtprJl5d+r8nrXAjU7oA15vWRH2Hd7Y1+L5n6jgDCd7dP0+lstnPgef8jENch15JqMa92ux2A8/21QGIcDs0SjBGFRM2vMJ2j36QCAYKUWV3SAhi8U+AlGSk/uQcKnWdxG2Q3pHPH/ckqchVbCdsOjZXl90bSz+Crwx4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XRJR2fQ8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so771278f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733128261; x=1733733061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr1WQaW+vl9ftkqr49hXwsrwWQsvpIpp7R0EYmxCG8Y=;
        b=XRJR2fQ8ONq0UYsMGy3r2wu5hZlY4/ePrfl39wO1B0bfCI+ul3rGEq0fohw5JPLk+j
         p9yWDWYRu7ZOTeDskU3Pxx+pvSaH/1B6lcW/kDMN2FPnGNcDJZTgf/QBmE7AbhzV+cFh
         i+rT9qC4I74d79s6f5kY4kh0ZvTa6hpgdbTY+2Ww8rXSPE8yTZRJS3CfLyHs4xF8D5PA
         zDDcaUNvZ1LRTtjGWRP5VVhhE440tUPq8jelEBTCUreF/VLQyl9G1On9ZmGRT4uLsla1
         Omwhof5jwwqJDif6UqU/bBRBjGT82iKIwK3GYX9aOcfr4XGOQZjeV5wNIPZwzQmvfbnF
         YJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128261; x=1733733061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr1WQaW+vl9ftkqr49hXwsrwWQsvpIpp7R0EYmxCG8Y=;
        b=CDJcAfqbiPBMRv22PGo/nA+jE2DC7ufLEWQJao73XU6siN8/U5YY8LlG7kA2V0cBcF
         P8ZlClRDHlkTG7aSDB4XB1APGzf2mrdTAH+5nKFDi05UMQpMJfYcFXEXV2SBQy3mslPT
         w91OygUAoCD3TE+r1iJMKsH2mFrgR+fVgDf+zKiQE3zhg3eII3ZPmz2yRqFLDjNiyBiN
         xWRRSfZr3MCvPmd/OfBwrsygIR2VWTC5rX5c88dOoGrMbyJrJ4bERCfdQzrhQtYbOZbT
         FUoS2soF2UIjtQNRAvkFjO8jh3chM6eMJttKooJmsGFC/2WF04m1zqqYq8tos4Ps+Soc
         l6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVCEN49vsZRyrikR6r6ffBC7lHWU0NY4HJC5LDwyzdPtrQ9Z+KH1A7vxiB4J6UA55aXS/AvvSzaymt6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzteezz1tLOxssHJJeXPay88OjTtOpjQKUpCY8nt6/vF/L+RGte
	R+MOO+NKsFeHPnjOoXB+U7Q9fOhOw6wVoLIVk6kipZyqykkMjWAxPrKWKZU3LmU=
X-Gm-Gg: ASbGncuov+knhz1sneGtignYiQyg30y/EwpQ3FRTdLlRyiVrEDsNr38fvt0RFFTakKE
	giL5wMwEMpzKeD6ygT5eTSdbtAmbEdyDrjRrAb/4YiYreobk+IpIxE46rsv6VdySAtCfx5m7eTM
	yB++Jnfw6VPAn/1CaB6vu36tt1ekZrnWl+d8sXeWWwZIMXluZ3j67yh1M3qm/ZrGdkgsytnHUaS
	0tpSusva04NW7NlcK8vgSMafi/HBkm23WoQdXTCYvGolWtrAw==
X-Google-Smtp-Source: AGHT+IH0qD4qJ+Q2+Z3HWwSBPO/fM4Ao3Cp9So8OM+vgZLsk3AP7yVg8oGPeVLdEmdz1wJc5I4R3Yw==
X-Received: by 2002:a05:6000:2d08:b0:385:ee59:4510 with SMTP id ffacd0b85a97d-385ee594757mr2437769f8f.9.1733128261466;
        Mon, 02 Dec 2024 00:31:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:223b:dce7:ef1c:4bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e32ee381sm6841715f8f.76.2024.12.02.00.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 00:31:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] bindings: python: relax the verbosity adjustment in build_tests.sh
Date: Mon,  2 Dec 2024 09:30:59 +0100
Message-ID: <173312825663.12253.12650640900797258431.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127133139.120107-1-brgl@bgdev.pl>
References: <20241127133139.120107-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 27 Nov 2024 14:31:39 +0100, Bartosz Golaszewski wrote:
> When building tests using the build_tests.py script, we try to increase
> the verbosity using setuptools.logging.configure() preferably but
> falling back to distutils.log.set_verbosity() if the former is missing.
> 
> This however creates a hard dependency on distutils on older environments
> missing the recently added setuptools method. The build however, can work
> fine even with default (low) verbosity so instead of bailing out if the
> second import fails, just keep going.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: relax the verbosity adjustment in build_tests.sh
      commit: 27ec1af8b1836a1fcd6cbb8376324a21ee5b483e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

