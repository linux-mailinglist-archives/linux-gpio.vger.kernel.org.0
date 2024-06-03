Return-Path: <linux-gpio+bounces-7051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBB8D7DF7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 479962823A8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8EB763E6;
	Mon,  3 Jun 2024 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtIdQN7d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB893BBF3
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 08:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717405131; cv=none; b=gt7eXpgHdpXHPi7PaoiSdEEehjp8A+QkpIINd/q55FzlxRnAQDgN6bg/RNCMqCjBn5HGeAVQPq2wRzQkKY7X15brJ1v5Z6fKLkZ+H+wPwFk/92nHUAaXigcIjuueBIKN2gCo6QHbkR+e0e4/D4mltn3YBCS2ZaEAucb1CziNCU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717405131; c=relaxed/simple;
	bh=71O7+w8h7V0ZA+AFV80dvLIt4YDwh7Ouf0pSxCLVGRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhQBnxwQHyoTDGvH0X1SY8FxSnVNdRRsojzN2NBVsCL7c5WAyH2ZRoKOGi65Nol9mUCv11w0bQo6rZP8EFqH47ede/9+2SQYhPaV6I2z0LuxJCREghw/HPGJYK7CgZv+KOXAacL7XoHzL/lPlTRAIMmQMDv8gr+x5aWkIxDyRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtIdQN7d; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c9d70d93dbso2721134b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717405129; x=1718009929; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=71O7+w8h7V0ZA+AFV80dvLIt4YDwh7Ouf0pSxCLVGRc=;
        b=PtIdQN7dXD749Co/R+1oX8gUNI2s9kID+YHJwSUwNiEtLu63vUqe5Z+WYg8iKCEpO1
         y2bQxGaDsOF+E0wn7gJ1PnSFTLW6EugeVLXr6MOufI4zpTszjLi0o4Y3u3SYY40e1yQ2
         2I6aFr4plDKu9KEOPIHnG5oviT+gPkvr9tpG3yjicA80hh87pI4f3TjMkDZEUcXje74B
         oDwp9guOQclR0Wxgud9ZxY1Pk751OjmvyRmzJort0lJWoXn0hbOxFHnWZMpu2xs2NPkq
         BA+yJzPjwuDr7AFfATv0D/bOd6kN3KphVag//q0G+H9BLFKfHyaexezx7krQd1UrxyT3
         klsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717405129; x=1718009929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71O7+w8h7V0ZA+AFV80dvLIt4YDwh7Ouf0pSxCLVGRc=;
        b=Qe/kgYYOotH/fBxGjn7xSwYekWLWbdmCgIrvbNuSaUXzL27UPcys9ywAiYPoc1LRxN
         HAhhZJIKYwEAotKBzIajdptNg6tdKKs6SHlRegqK5vkfeccgulPPe1Xyaz10x0/nC7QB
         CayMWkzwLpt9MHbdXoYBN7qw4GTnK6sEpNQ29ha9KiRVfXg9hUtYWdxVVd7iXOm1cFG8
         BEM/OGFs5cg9giB2Hd/Cdp/+OQRtZK/EetKp8+gJIulxMz5CazXsGhBYH/f+NkIHb3r+
         ZtKzexXPeftpI6XlCb7VVAR5+eSRnwZw3BeDxvUzhe7r8NbwmkGGafSJKwPf8S+olYtn
         D0uA==
X-Gm-Message-State: AOJu0Yyme7raMZ7xz3Fch9/f1HmZRem3EZm5/s9ny8W36bDYp2et8ZB6
	xEYRl39tkY+hbDliHtDqWkayRMaiQRrHi/hmin3s5XAWsTzboB3sdJMsEg==
X-Google-Smtp-Source: AGHT+IGEBY8WIuO2rfotEc3SXzB85X82Yj9PqRFeW4OM2nag0K3n94hS9XuRypYV6gIS6l0pf0b43Q==
X-Received: by 2002:a05:6870:f202:b0:24f:db4a:bc02 with SMTP id 586e51a60fabf-2508c1b9444mr8708586fac.52.1717405129056;
        Mon, 03 Jun 2024 01:58:49 -0700 (PDT)
Received: from rigel (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cedccsm5051285b3a.24.2024.06.03.01.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 01:58:48 -0700 (PDT)
Date: Mon, 3 Jun 2024 16:58:44 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 2/8] tools: tests: don't declare and assign
 separately
Message-ID: <20240603085844.GA78808@rigel>
References: <20240531134512.443850-1-warthog618@gmail.com>
 <20240531134512.443850-3-warthog618@gmail.com>
 <CAMRc=MfHwp8Lj_5rFiqo61E__Y9+o4n3Bu5e4KSF0P6n0DR-0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfHwp8Lj_5rFiqo61E__Y9+o4n3Bu5e4KSF0P6n0DR-0Q@mail.gmail.com>

On Mon, Jun 03, 2024 at 10:52:39AM +0200, Bartosz Golaszewski wrote:
> On Fri, May 31, 2024 at 3:45 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Fix shellcheck SC2155[1] - declare and assign separately to avoid
> > masking return values.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> > [1] https://www.shellcheck.net/wiki/SC2155
> > ---
>
> Shouldn't the commit message say "*do* declare and assign separately"?
>

That is wrong, my bad.

I think I was going to change it to "don't declare and assign together"
and got distracted mid-edit.
So either that or simply "declare and assign separately".
A leading "do" would be redundant.

You ok to fix that, or would you like a re-spin?

Cheers,
Kent.

