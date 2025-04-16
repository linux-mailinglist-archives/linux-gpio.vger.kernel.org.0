Return-Path: <linux-gpio+bounces-18973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86EA90824
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 17:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE1F43BC87C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 15:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E76212D95;
	Wed, 16 Apr 2025 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kTrCEUtS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7872116ED
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819000; cv=none; b=L8O+1JSPgNaanWDkpQSFWoPdejhvt0NeXZ491TC2x1klkKfv/ASgvxXaVEwqCJK/fCfrkrBWj6k+oBaGcJQd+kfdK8KgbGvNRkstwqfkn/395blWZF104tAbczOB71spgquBoHrCE1nu6SuZUQ7qzu74xvADfhB1nkygJUUVCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819000; c=relaxed/simple;
	bh=kN9dNwFyctrG+SygPEzy1CiyJrpLugqsjEpUI395zpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdF+a9RTKZopvKJH3ByqKvRCIVQH87C4O9yuOiOP37Ud85rVkzT4d44GgW9WmJDjDv4fU2LAIarIz1j+65hZHZtygcoNY118E18ubILx1d68R9vWmcN/+Uo1h07BPcsuhptKtyN0V3/w3ah8YK5LUA7zXRgLPmXShnmloNcRtss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kTrCEUtS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so69107455e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818995; x=1745423795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMBYANIH4HAaOQkINTO4YWTiE1ri6Oa799PROw9ojEg=;
        b=kTrCEUtS95z23gkj+VfyezV0pCMuOvAsQE/rWqwzBppV8VLvguh9fCiVynRUISk5Ea
         R3JF/ZEbKuSf1XSdoML65VTnlJWNYHssZ9GktvBVXyreJJon0dkjnJ+zqXOACY1ElLTp
         GeBDPd+70Ii1czjjtETj6x2Axl7Y195lL1VmOAYXMH2ISWw2MnPSfM8KWOPV+wJ7mvKU
         tmiyO1wywl0egDyTRSM5BWaIDABPt1qJdMA7Yd7LyCzpwLHzke/3ZpLHf1SOiJDI4Lck
         MpHo5WA0+DPSlU2DsTflxgVLefYPiOvCTk3aIBLtps6+K/VxW8AbMRs3DHsN6gVQ/PkM
         OGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818995; x=1745423795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMBYANIH4HAaOQkINTO4YWTiE1ri6Oa799PROw9ojEg=;
        b=I8rutRQJNrsK5X8o8q6X3LycLZNKe4Ij4dpqAQiUiOXWfcY+Vo/SfaDX0edGAMVc00
         YrOd7RdJsm4cXTCxd+eu+r30bHkBYPzFIWw12rcF+pacz6ZU4IH8UMiXulJDGkJgIGPW
         j8rq6kNMVWiSPSdh/TVwELv4+EPMPu5LoZa6ByBxrWzpwYT5cg5U4G7T3cTwKlRfntSB
         gACGLwV+dwISGAo8H+n2VAgqf1FaVwRW4srXNaIHY1L4XB9cQq2s9XvcYIhYHrN5UUt3
         BIjf55mumTxbuA24M4WDkZDcnCC7m/iOIBTJ/OiKxf6ue9mB+0jalt+iDE38PJCI/ixV
         qbBw==
X-Gm-Message-State: AOJu0YxYxPtGNGJEVZSp2es3B+lXApI5WoJFB0+9j4QyiwpiLVYYBt39
	5MmdAAKQMQokwHKAWyIrmzAux9iiEH4ZV109d0FvQRPLiL21zZ8nJllU3h8Q3oQ=
X-Gm-Gg: ASbGncsWMcgx4j4TldTyMla9SrsXXXKr53EdaBlC1pNxoKHcrCGWk8y28sKpfa5yOF9
	f7LEdEuoa7F9dQvDxnuIHKVfZezKANawbJb2vl/e59nyUYq39msOBeI7fdZqZxqhqKOZuUwBxFe
	+yItSZTFMH4LeadrLcHTX1Hd6Cmi24l9iQ+vJ1uIjCskLMbi5V4EKjmY+YjCH25Ov25ud/6pA1y
	O26qWxaVlRzJtvSJPQRf7rn02zoR94SFaGBfi8ceIkmkomJGVkArZArGPlQKoROcwSyAxv0cIso
	DDjnP0qrC2ZCBYwI1C+pz7UvH2DhHGAp5wzYT70j
X-Google-Smtp-Source: AGHT+IEzIxlfH9pTJUHwivSjsywFDcUHME2sz9N3dkUWlFPtI3MHdU98OYXUtjaYYsLokpDPqmJi6A==
X-Received: by 2002:a05:600c:4fc9:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-4405d6aab0amr23312195e9.24.1744818995211;
        Wed, 16 Apr 2025 08:56:35 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio: ds4520: don't check the 'ngpios' property in the driver
Date: Wed, 16 Apr 2025 17:56:27 +0200
Message-ID: <174481898215.8191.5803083657000045328.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-gpio-regmap-ngpios-v2-1-26f254014f57@linaro.org>
References: <20250408-gpio-regmap-ngpios-v2-1-26f254014f57@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 10:40:57 +0200, Bartosz Golaszewski wrote:
> This is already done by the gpio-regmap abstraction by calling
> gpiochip_get_ngpios(). We don't need to do this at the driver level.
> 
> 

Applied, thanks!

[1/1] gpio: ds4520: don't check the 'ngpios' property in the driver
      https://git.kernel.org/brgl/linux/c/c21c43c7b59f9f2e357c3f54072e3fdf89ddae22

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

