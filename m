Return-Path: <linux-gpio+bounces-17836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D320A6B301
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 03:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D9BE3AB5F1
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 02:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6F91E25EF;
	Fri, 21 Mar 2025 02:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="K/mHHBl9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF818A6CF
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 02:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742524557; cv=none; b=NsKpu8a6BAg+mzUqWPI1bk0RbWBkE2WN9KlJowoFT85628co+GzkMFxeSkZCnWFpee7EJwkX0+A4V7uO4BJyKTT1KJQHJ9PLZo7G1cThObK14Wi/jtGAyXgLj7v8PiddFc+ENUvCsg2BkQQqIUswDUn4W5fVa9cOyVxT9rWu/vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742524557; c=relaxed/simple;
	bh=BE8jlk33PSooCmmTKi3YitnAtNd4pRxBjaru26b720c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRtEzmPlCzexnKQ64/WYnGlOG6i9vjNpw1wfvAZDWvHTw2T1NZRLm6KkoiM2PnXEIDWxc42wrkc3IvQBrgOhj5bZ367RLNOG3K+bVD2QeWUZcCeiYk7arD8p/J5BhuS6qS8mtgXMmhXvYNamLEYDJ/dfpSlPIgNp1W1RRJQa1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=K/mHHBl9; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 589A23FCC7
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 02:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742524552;
	bh=+59sSS/+H+AM/QNXIwPCiTuvLYKPkjZvDqMYqhJDfO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=K/mHHBl9x0EjGX1+rMZ64eM0/Wt3Jq9M7hPM3j4FrndrYmhbVQxP0jfwUOVb2Cw9V
	 EP5ESvmaLJ1Z8/GLK6lp9/dDFsWphQ3S52uYoZf0bL6d8g9U8mZPiSTAyDGwcHjKOg
	 IEf9A4n2rDWHEsCfuLLQzISIKG4Yl75C4jNvxV18svARZf7KUSnCYx1KabRNzf8F2V
	 cARttQqp0uSNy+WQRGq4CBi4KycXxglII4c8Zlt031lLMKiotEJ1Ks2suG4AzT04Si
	 tBTnDDk48PlcKpqKxAgzhf+IgFaMSTnmEZyr7fBGcT1K1BMwjTYHgRQLAh6wJ76zOU
	 AZaUUxRupA/qQ==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so2246787a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 19:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742524550; x=1743129350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+59sSS/+H+AM/QNXIwPCiTuvLYKPkjZvDqMYqhJDfO0=;
        b=QEYdJB5eNk9slgPOj3UhaYxeYStURH5NaN66+/7/qTDJjz6EjHFCjwi9cswmygDm8A
         evwnAjDEobSWiFzVEAA0xBbt37J0wwsPnozshoPhPms3HA3lOGXykz1SdWquSqavA5Cc
         wqeYFpfKpRDJRI3yV2uDFKKMihtjVnu0ILG6mlALvKOWK2wBoPMXkrEJDCnwqP9ZT0fl
         EDcvyh8trrZ1O83ZLqhy7Tp1Q9zL4M9rn8eEt5SwIf3B6rYrE65qaYrlxbMwcIyrLk8C
         dXWKxVL6uKcsMirn0jLXujgXot4N7EnnFdcBXAR/00MTs7FsZ/ISNIfiZ8FXJy0zMPPF
         5aJA==
X-Gm-Message-State: AOJu0YxUtwXJ641SrwemG7ujTfSFgCIC/HeUXWg8d3HJuyI6Uutf7LdP
	4rnfZh3LXmYepwkW2lHw2rNtihkOk9pbEkZ8mGSn9Ga7wLOWhvRlP8AQ+TDYhdzSzuQAXJT8gLc
	DVRLx036ndh2Ju5jNPL1kEQ4D6QD5H3O9tkonwmHGlGBNLouJGoSX/oFZTLT6jT98dlisT9TxfL
	k=
X-Gm-Gg: ASbGncvbPN9mo9gB7xNg0CeLmYfIGRtiVeCeKhxon2Yn/0vL7QMMQtt1wXu8goIg6t0
	FjoVpedcdr7Zul7D/uskuPNkYbYbKbihlSBSHs81yVwoqHVJK7t11toG9RcV1cFu8FtpiTFYkQ7
	JHlai2Q5C6JUWW8Kr2/BF5owi6kHnTcLvn6kJdeJDbZyGLSiy4Y37egymQXK+WwHAjC6JqLQA4n
	rl3D9w7GcttQnrgz5pAF9oIoS+xIxuWAaLlDQ0nwp/WW1HnoQCfNqYu9RaO/XPkx//4Q1VQcCZC
	by93SweHy86QPqGi4w==
X-Received: by 2002:a17:90b:28c4:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-3031002af0fmr2361493a91.31.1742524550521;
        Thu, 20 Mar 2025 19:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsivSswYTsxCGRVr+akOaH/124FWuyZyG9yFJTLTdUNp/4V3EIGzgEeFD5Wz4qmuJPl9nqjQ==
X-Received: by 2002:a17:90b:28c4:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-3031002af0fmr2361354a91.31.1742524550126;
        Thu, 20 Mar 2025 19:35:50 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:2dba:1af7:27b6:24fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811e34dasm5396765ad.199.2025.03.20.19.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 19:35:49 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:35:47 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/9] gpio: aggregator: introduce basic configfs
 interface
Message-ID: <6mcl34zdx37gjh3a3y4lc5kgb2vv5notvs355oewiwogpgg5g7@jcuukymbifnm>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-5-koichiro.den@canonical.com>
 <CAMRc=MdOSsakJm4H5=cqVzdKDrrMFO2t-wKVWRCU83saozepxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdOSsakJm4H5=cqVzdKDrrMFO2t-wKVWRCU83saozepxQ@mail.gmail.com>

On Thu, Mar 20, 2025 at 04:54:26PM GMT, Bartosz Golaszewski wrote:
> On Sat, Mar 15, 2025 at 5:41 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > ---(snip)---
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >
> > @@ -90,6 +124,70 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
> >         return 0;
> >  }
> >
> > +static bool aggr_is_active(struct gpio_aggregator *aggr)
> 
> Series-wide: I would prefer a different prefix: why not
> gpio_aggregator or at least gpio_aggr?

Actually, that naming was intentional, but perhaps I could say this is just my
personal preference. Here is a breakdown of the function name prefixes:

  Before this patch series:
  * forwarder:        gpiochip_fwd_* + gpio_fwd_*
  * sysfs interface:  new_device/delete_device + aggr_*
  * platform device:  gpio_aggregator_*
  * module init/exit: gpio_aggregator_*

  After this patch series:
  * common utils:     aggr_*
  * forwarder:        gpiochip_fwd_* + gpio_fwd_*  <-- _Unchanged_
  * configfs:         gpio_aggr_*
  * sysfs interface:  new_device/delete_device     <-- _Unchanged_
  * platform device:  gpio_aggregator_*            <-- _Unchanged_
  * module init/exit: gpio_aggregator_*            <-- _Unchanged_

Do you still see the need to change as you suggested and send v7?

Koichiro

> 
> Other than that, looks good to me!
> 
> Bartosz

