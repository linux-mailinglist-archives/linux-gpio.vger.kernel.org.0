Return-Path: <linux-gpio+bounces-10779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5C98EBEC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67C6D280CA9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 08:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47533145FE8;
	Thu,  3 Oct 2024 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apG78kUG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5841145B39
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727945759; cv=none; b=ptnxPPJ5gnDmTDTeZOpIcyu/D9G9lhXclKFMguwZqwQbKM60RiASEG52nu22kkXcCgbeRVftvTi+Q25F34/0PMGv/SyjUHCmMkGSRGzJ+VvAjpulBF9d0orMKDjOHPwhEdts2hoKf7U0PeNwrUqt6SsfBtivQWnHExqRUgaitGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727945759; c=relaxed/simple;
	bh=NFseTKCOfUnd6YGvFT1YA1CNokqeF4c+NvOLxViVBGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt5pSOfx+4d80DZ/VHgN+1KlzCENcwc9wxQhnQH9GdRiGRMZZzNiVPLeQtAjzgRWZK+5Cno7Ht8lw6925OVyIv2T7i6wIPDLCpHIaAhRIAKqQjX0ZVnMXeMtQdiD9I8CnCKp020/g16/efZj5XnCfbVbe/f6hCMaheFRIjUCIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apG78kUG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71957eb256bso689534b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727945757; x=1728550557; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glDx/C03RhckvSYd3xurs02hCKr9YgFxeC2WKhHFtEc=;
        b=apG78kUGYBeuqmRiYTh9bq7obd58urTpUYDYJouDWFpowvU6Z7yl/vdwq6I07ipqg9
         qcqDCumP8yX/N+t4ZQ1MfMifBo9qdkxak7N3BIrxjBgEANL2ROA5fUafjKNqADwHGiTh
         an+7933OKpB+4UzEwcLtM+qtOfTelNcuSIY3zDBRA46vBsJfam3+72WWuGWIyshz+Z3T
         JBoO/WtIhhOQni7mrpkDHEemYlRV9Zn9Vr6aE6+Pgbq2a7WB3ZftZM/d0mHqRyeFfQ/P
         sQHklCbZj3ds3iEJ7gnuf04BKKCX5pwo+3HEokFDWT9G4KU4pTy31EpZRC2bJ7TgBl4z
         VuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727945757; x=1728550557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glDx/C03RhckvSYd3xurs02hCKr9YgFxeC2WKhHFtEc=;
        b=JbOulpjePA+8qAZ2qs43+byjlZg0i/Kb8gtH6t8nkrqyRo7LZb7/DRitK/xcfc9bq7
         aZcTS7B4uS0kO2WIIf2/tf7j2sDtVe3xC29DJNhmNbNzBhYry0GP755WXzH+afw+H24H
         lWvIMomYwXvEKJW4ww646C1LbUvGrL6GyalTuikauDz7Hvx5eVyYXjzHOeJwkDiMNN6N
         t/h17wFaIxI/a5ph+umMVGDaX/Ja9mFP/wRF7obHRpIok8D4T3dZaYRotDDyntS1LYrO
         REmongKIciOuZ14tIULWGVU0CzCDZ9gjJHvSAEjGKCmu7d6jtoGcJ0WKK0GGDbVsuQXJ
         ppgA==
X-Gm-Message-State: AOJu0YzvYBBHD1TYcfbO3oFgAjq3EVfLsuryswDOZdk8xdt8ph8rp8RA
	h9Kr1LhHuSNqsn4eLt+4/u1hc+PbN7o9uof8BgG/pTKezPctOK5B6VYi0x+9
X-Google-Smtp-Source: AGHT+IH/KD9Ah9fXGnfpJLHDvXOiPMEi6AFcsMgkIM7sOgWAGRuGRbHxNv6UungHp19D4PFrsQFidw==
X-Received: by 2002:a05:6a00:4fc5:b0:717:90df:7cbb with SMTP id d2e1a72fcca58-71dc5d5bf53mr9390629b3a.22.1727945757071;
        Thu, 03 Oct 2024 01:55:57 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9ddc22csm832068b3a.132.2024.10.03.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 01:55:56 -0700 (PDT)
Date: Thu, 3 Oct 2024 16:55:52 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Fazio <vfazio@gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2-rc2
Message-ID: <20241003085552.GA236079@rigel>
References: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
 <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>
 <20241003032457.GA63612@rigel>
 <20241003033640.GB63612@rigel>
 <CAMRc=MfO2NB0jpzhHU-cU00zVesdofM7EUqd11xmE9sCVdBQ-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfO2NB0jpzhHU-cU00zVesdofM7EUqd11xmE9sCVdBQ-w@mail.gmail.com>

On Thu, Oct 03, 2024 at 10:45:35AM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 3, 2024 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> >
> >
> > Why is gpiosim-glib being built?  I'm not using glib.  I don't have
> > glib. I don't want to install glib.  But now I can't build. Yay.
> >
> > Cheers,
> > Kent.
> >
> >
>
> That wasn't the goal of course. Let me build a vm with minimal
> environment and go through each build option individually.
>

It was the --enable-tests that pulled in glib for core tests - despite
--enable-glib not being selected.  I was able to build everything else
without glib by dropping --enable-tests.

Cheers,
Kent.

