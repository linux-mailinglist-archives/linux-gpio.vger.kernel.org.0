Return-Path: <linux-gpio+bounces-7057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E98D8031
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A2B81C23410
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADD682D64;
	Mon,  3 Jun 2024 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajLVMkgG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA744C6F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717411150; cv=none; b=ZhHE0J7eKh1YBgOg6Y68+hcWODIoUQskhDk5GgK7xlQwqrSNFkRlgiP6UmAMSv8/qX8Qj7gJuSNDiHX7sKQMcZDf3rFUEEn/2l0jr1A22O37J2SA5f6a4JX40mThHbVZCpRXwOQQccOuCI9F/RvRCRPNFJ/hJB62lrtx5NwfM0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717411150; c=relaxed/simple;
	bh=7PGLHGZUlDuGoDZugtL8S56qGpVqh/+LUwFVrilyLII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5nlZyF3s8z30hft2BakdNxhKHzsyKB3xyNuxXIHtnysXQKTTSX3iX8vcvxSi53frsL7V6v8MKWxE8A5xZu7riXAkbiNx7FKkuj0VZbAcEVqTa6e33t7Iq6sDdHxzd6WR0JzDpNrxVOdt+UOuQv3Co42aQvcTAzvhEKDWTgxpzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajLVMkgG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f44b5b9de6so24385995ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 03:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717411148; x=1718015948; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7PGLHGZUlDuGoDZugtL8S56qGpVqh/+LUwFVrilyLII=;
        b=ajLVMkgGb8o03VuvIfaDL6H8bqLu+s4MzFet45+wrCAer3NRr5Br5FoftyPR9U/TSh
         3pq1pQdi78jfW4e2skpBdX4y2Qz4O4McgCLPQ8+/CJ0qLlmyb2wwbhW/MP1bGEhMeHbQ
         e/T/HxT7FEBeHuWlJF/OGT0RhU16+XfVcOGa+xlSdzOXdXkbT/NiF0cuRep4sl4XQI65
         8W3QeW1TYm4gWM2IS4B3uHIw81NG01Tg2RTjEthQBZmFeLpfxh58yxSZPko2ag+/8TQz
         VbhH56hWjOvDEcf83YgaZtK1lVyiHSlDY2IzzaBNgervp5Jr7j1rrVkMdM0L77nv7lJP
         xG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411148; x=1718015948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PGLHGZUlDuGoDZugtL8S56qGpVqh/+LUwFVrilyLII=;
        b=dE336QgVIwetmaZk7vBoX4UjZP+jdM78orUokCSBl21EpSKZAwqUKV0Voq29sitmvs
         QMlQHrCJ1/L4jSqDgwHUudQFspdxvZ0u6IdUYJEBaVho2Wah9t6JWAagCDag68gFkU4G
         PPazkDuM5pcvbX28h+qE0ObmPd9VkG5hPvmPCizapI1CY0yFt1kkTcIPFI+nX3eeSIJ8
         VNtobfBzbGJ4Op/3JXjo4pTvN30XYSCN45wlxLZhYwSToEjwIOXIkcAMKEGFvSwlMvCU
         cv/4PCQXMBQ2RTGv69OxMiYfLwp9moIi8nbxsifoZpY1WKkWOCc+H8aKV4d9sKeaLQDm
         yGig==
X-Gm-Message-State: AOJu0YyJogztRVkbIUmRqATj8ygmoLNwZLhYi/T4C+M+WaWUhvbZ+rhG
	u7C3BYroQ5zYATth9JrCmsCYwfyReJ+3GQWlRPirOGMha6Ky8KD1
X-Google-Smtp-Source: AGHT+IHjzJAF2w+t14kRjxqqvxl1UINflE1AQbd56vZEjpcHpFVEKMLqMWdHqCWYjjOEQm6HeyjMFA==
X-Received: by 2002:a17:902:d512:b0:1f6:782e:da40 with SMTP id d9443c01a7336-1f6782ee2f3mr31474635ad.62.1717411148374;
        Mon, 03 Jun 2024 03:39:08 -0700 (PDT)
Received: from rigel (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241550bsm62345435ad.277.2024.06.03.03.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:39:08 -0700 (PDT)
Date: Mon, 3 Jun 2024 18:39:04 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 2/8] tools: tests: don't declare and assign
 separately
Message-ID: <20240603103904.GA95158@rigel>
References: <20240531134512.443850-1-warthog618@gmail.com>
 <20240531134512.443850-3-warthog618@gmail.com>
 <CAMRc=MfHwp8Lj_5rFiqo61E__Y9+o4n3Bu5e4KSF0P6n0DR-0Q@mail.gmail.com>
 <20240603085844.GA78808@rigel>
 <CAMRc=MdKTXeLWMkaRqg6z-iTeThWWCYcr4En2UgbM-81BXPFpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdKTXeLWMkaRqg6z-iTeThWWCYcr4En2UgbM-81BXPFpg@mail.gmail.com>

On Mon, Jun 03, 2024 at 12:38:09PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 3, 2024 at 10:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Jun 03, 2024 at 10:52:39AM +0200, Bartosz Golaszewski wrote:
> > > On Fri, May 31, 2024 at 3:45 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Fix shellcheck SC2155[1] - declare and assign separately to avoid
> > > > masking return values.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > >
> > > > [1] https://www.shellcheck.net/wiki/SC2155
> > > > ---
> > >
> > > Shouldn't the commit message say "*do* declare and assign separately"?
> > >
> >
> > That is wrong, my bad.
> >
> > I think I was going to change it to "don't declare and assign together"
> > and got distracted mid-edit.
> > So either that or simply "declare and assign separately".
> > A leading "do" would be redundant.
> >
> > You ok to fix that, or would you like a re-spin?
> >
>
> I'll fix it, others look good.
>

Thanks.

Kent.

