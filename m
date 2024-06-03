Return-Path: <linux-gpio+bounces-7073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 819888D822C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 14:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B39BF1C23C0B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7D312BF23;
	Mon,  3 Jun 2024 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2OdX9si"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4339577118
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717417458; cv=none; b=k1VEekVcWJPjqnBJnyEi25cYuzljeOQUrRGQ6pOa5Aba0/6q7Ot8sxunML2s3QshptwfVQ1ODR+ulbRdut0kOyOrTCrB/ZbcDAcAuyaadHh3J0OLfCj1ZWDT0icoDkqMPvr5tb9rclkqUwtwOWlNYLDQxr1FtPJfPU+mqBROIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717417458; c=relaxed/simple;
	bh=LS9m73iDWDHbnvOJfheCR1X1a0DblOsMFt9pTyziJcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRjAdIf0c7zCT12c+F7d/xnWezr0WVB0qP4jktmOOhZ6fNLhvlu5f85XPssrpR03wM69HwDCCB2Yp1I8WZx+bJLVCS0cp6qaWqg7qkj8AHHBVQEBn58FjHPRWVIHxHQM1zjjyjKN50K8lO0VF5vHybvd/M1nDi+cF+R2ykr9a/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2OdX9si; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f6262c0a22so22778675ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717417456; x=1718022256; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LS9m73iDWDHbnvOJfheCR1X1a0DblOsMFt9pTyziJcM=;
        b=I2OdX9siQlZHwWcrxlJe1Hx6eTjOzqwBzfQIwZn8Xw3lXmLAvkqpNqKy3wzaB78FHK
         6Fo9JRRzpZicXtt7QOitiHDhilDB2kx/gGu+kBwqJcjC1m9Gz0Q9mvcgBYzx2cVwKt3T
         wUu/bt3LG+E+c+clSnjH5vAxpeEsXIDYnyWfyHVqBRj5QKyH0q/K8FhZT4ti2Isb6olE
         OTo0wSLDxhF8ccSZdHlGMr6yZPD4NgMYwonA7TEmDX5xSvOWcljkA/bcyz3yClH0gcg7
         KD2ReVHAFLr6ALQr5FNMqzjo9YyNUH+CUuR6Qj13jrPscne+Gg3yodWcK2lWvjW6a/n0
         jWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717417456; x=1718022256;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LS9m73iDWDHbnvOJfheCR1X1a0DblOsMFt9pTyziJcM=;
        b=RjsGH8INHFL4U3z59AYlggfXI/r33C/IeYPCoBTix8jTaqW3uUELSfqkjgBuCI+qYM
         Kyp40Z6yOl3RgIsV7xBALoW8p1z0ygs0P465HjlgH+97TAy0p3nBZKUcqBzh3sO3PVd0
         cELSTQi7LJ0uyLvdqTr97msUwmgcmotot+sbH8W7ToyX/0z8IeNqJmUWsNlcYGXhgMCD
         boa0bZlq5Sdd75DcMEoyLUCdg0McOrwzHSoAT6QHV2pXmPfCFtSFsVxggoeOEVpGJHcA
         AtMkw8nbJhhfmwkpJwwl0YYqXmjzDxFCDkr6ojsmAgytvXsNOvIDqrWZOCeerUPwkh2P
         MGGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL4mZn5RLBZyf6OXadMA5ERgwinEt7Aq3f/+wwkYVYPbtCPzWzkCJg8E+ohp5RNOz7daBYCNpq2dffArnsPMEsN6Zfh6BOQBKtJg==
X-Gm-Message-State: AOJu0YyqQ0+TJf8j/vAhBIbEZpaDMeV8AFbkllfElr82sNtZ60CtEQ2X
	dhjjq4o0YvJ4EymZm9EOByaK4447L1TGEVyN0+IcJCFxKO4iUCBhWC/TZw==
X-Google-Smtp-Source: AGHT+IFHTOHYbcrlkW+9GiIdGuZyKZUpTqINHZpGbRynZOCdc+OruFDFk3qLt6cX83oBP0WQ3SJfrw==
X-Received: by 2002:a17:902:d508:b0:1f6:30ad:74c5 with SMTP id d9443c01a7336-1f630ad7850mr140387085ad.19.1717417456459;
        Mon, 03 Jun 2024 05:24:16 -0700 (PDT)
Received: from rigel (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63236d26dsm63673305ad.103.2024.06.03.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:24:16 -0700 (PDT)
Date: Mon, 3 Jun 2024 20:24:11 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: cxx: Migrate C++ tests to use Catch2
 v3
Message-ID: <20240603122411.GA104620@rigel>
References: <20240531184223.3949069-1-raj.khem@gmail.com>
 <CAMRc=MeLwYPCGrRGgXCaoqQGH0Q_6JKJFizR28jprd5TpqRTmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeLwYPCGrRGgXCaoqQGH0Q_6JKJFizR28jprd5TpqRTmg@mail.gmail.com>

On Mon, Jun 03, 2024 at 11:34:15AM +0200, Bartosz Golaszewski wrote:
> On Fri, May 31, 2024 at 8:42 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Catch2 v3.x has API changes which needs to be addressed
> > in the tests themselves, hence this changeset is to fix
> > those.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> Thanks for doing this, I recently added it to my TODO. I slightly
> modified the change - added a version requirement for catch2 to
> configure.ac (>= 3.0).
>

The only issue I have with the patch is that Debian stable, and all the
distros based on it, are still on v2, so building for them will now
require backporting catch2 from Debian testing.
Probably not a deal-breaker, but another hurdle to be jumped.

Cheers,
Kent.

