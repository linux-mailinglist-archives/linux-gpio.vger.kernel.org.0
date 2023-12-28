Return-Path: <linux-gpio+bounces-1893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9792381F9A9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 16:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A83284B16
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 15:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DD5E56D;
	Thu, 28 Dec 2023 15:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtYoj8gm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C21E541
	for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3ed1ca402so48090475ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 07:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703777372; x=1704382172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rN3jnLiSA5lTL37YbXp03oKFnyH0U1kxNlWu7pTwjM=;
        b=FtYoj8gmYSyYzikfHgPG8mLWfBorXN6euwX2vEJuFf5I8qf8+cDlKHGSqB0e4igmqP
         hdlFszOsdCEOfLEJJ1aJpQhOcnhEv0tT0/+fNpCLlmWhnsHZFHj6HTLafwHAGEWIc3yU
         5qR37l0pRFAGxVmmnUKzz/X3731N20+mRgr1vRa//Ha8PxgQ4BPs3tJYqUIyOt561Yea
         QbKOzZSSMEYBcybWK+8xithSiQVDWHZI24tlHcVv9/kP34MeaLpdvnIoWM7iAh5CnYcQ
         nTWQMIeu5kcloactsHzLUG6B1A46fvKYo/nQtT3PJCiyXXAthbdmorAwJXVTJ5ATsa9V
         d6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703777372; x=1704382172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rN3jnLiSA5lTL37YbXp03oKFnyH0U1kxNlWu7pTwjM=;
        b=V/sQLJJIqSJomKkdmb6ektSIhGZBbbVONhEnyYO6Ga8TT3SztlhobSyhIYB8MwoXnL
         ffI2R52b/E7Qzw1zgjr78e/MMHMwfBEkO1IFr4iHMCYLRuZZxvgPWGU7rP7un4Se7tbE
         mILcQJYcfQDI5Zg3wBI80mwFGDs8d/DI3TyXkwAfD8GwZUKDqU6yGA9Amh6FAX5ZvZAq
         n9PVkT7BM9MxKt4fhRfzAGBnD1oiXYtWoTm3pOxQfRondg0gFN0NjEjLHws9ggX0TH8l
         MjH2IqUh12/cPCd7u7tsfDv1Li1gHRjddv8RG660LPbOgWd94xmmRULo2AipFAVfREXz
         eVzg==
X-Gm-Message-State: AOJu0YwoZgUggvDeGQmBkQO2vDQsGsIQ6j7Dr7Okg8YQu3blRmC9a9Lr
	kEcSLrIg7rOjZTY//IoscnAlxcjD+L0=
X-Google-Smtp-Source: AGHT+IHFy/6ww8+2clpcja/AVehOECXDPKxp9doYbRTocy7gZRexLL2XMeFNZS39bDjfDRCscrJiBw==
X-Received: by 2002:a17:903:44d:b0:1d0:9471:808d with SMTP id iw13-20020a170903044d00b001d09471808dmr9926881plb.93.1703777372436;
        Thu, 28 Dec 2023 07:29:32 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090a65c700b0028c7f99d93fsm5350154pjs.57.2023.12.28.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 07:29:32 -0800 (PST)
Date: Thu, 28 Dec 2023 23:29:28 +0800
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH] gpioset: reword note on post-exit behaviour
Message-ID: <20231228152928.GA124845@rigel>
References: <20231228130837.102524-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228130837.102524-1-warthog618@gmail.com>

On Thu, Dec 28, 2023 at 09:08:37PM +0800, Kent Gibson wrote:
> The note regarding the state of a line after gpioset exits is
> confusing and unhelpful to the average reader, if not outright
> incorrect.
> A common mis-interpretation is that this behaviour is arbitrarily
> chosen by spiteful implementors. The note also specifies that the line
> reverts to default, but that is not always the case, or is at least
> out of the control of gpioset or libgpiod.
>
> Reword the note to constrain the scope to that relevant to the
> likely reader, and to emphasize that the behaviour is inherent
> in the kernel GPIO interface, not in the gpioset implementation.
>

Could've sworn I added the [libgpiod] subject prefix, but clearly not.

