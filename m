Return-Path: <linux-gpio+bounces-7773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A991B49C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 03:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C64771C21270
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 01:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632DE14A84;
	Fri, 28 Jun 2024 01:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5vgFq+y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5A11711
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 01:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719537979; cv=none; b=EFl3ORInt/cvsn+1yjNBlbaNdVCHTOG/CVuJzPqw6I8K1gTKRH6zK8YyfXRWqJbQPVwAjWXREM2FnY3AvLI0qyJwHNwPgGYqZ+UwfoxYc/HxR1iBsJS6MKBvADebJx1vtzLn3Qp4ybiKQbqxjzGhHSoePV6KdVqTDQ7XYqPaTfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719537979; c=relaxed/simple;
	bh=vDXKAyrT9WEyLKi147E71URLCvBgDC7lnDIgvZ7DB0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ6wEuqoXrAPgl+uddD/NrlyGvBA6Z1lmCGUxpLO74yR12z6jqh5Ry4Cx+CQLD2kYRdQl43pradi3UYMfYLkfHUKVnsROzZBhdiRS1u5ToO58AN40fihFXTAsXi1A9IhEfwKFM0GriBAAJI/1TsQXwHmP1IbbdMYtIs4IPzJryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5vgFq+y; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5c2253cb606so30465eaf.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 18:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719537977; x=1720142777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rcCcC1U0EsMpGccliiTctOdl5C2TxzNIYMHs9GhCeA=;
        b=S5vgFq+yLZwIyGLjwKJaFU9FHkRnVrV554gWjbpvkJkmnzjzdTJV3fXgBw0lovez1l
         xZ7o0sEJ/h/LjTkwzynuaXI9O0Ux4aqzN49x/B2MYVSKW61/OwteKWs+yzcmHIYP3wej
         DCL9KZxNTFY+ZZhOpKp9FgtT+ci2W9+aMyktS6grEWN1xipuauSCmZ85TwOq1BkVHCyj
         UUi1F4W8xxbmBAruwOK8Wm2peLfuF2/tpMZICcMkJFimKPvDrNPRDI36U35gbvd8mVit
         sCSAS8wPksttYOkCIrlTs/zhfBurwoyC/5k+BsdqXZK8owOJy8eTUyO2dVZAmKLw6L3C
         74Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719537977; x=1720142777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rcCcC1U0EsMpGccliiTctOdl5C2TxzNIYMHs9GhCeA=;
        b=V+TsNQvmcCyECoGUAB0OkSTXidFTvt7Ahf2fPF25vMEBY5xjDfsFjWGMdMhAK36ODm
         G39lFOhKqw3uCZ6QuywQRjxNU0qBixE7/8z3MCY8J26kYFWj1+mQ9jfjM3sY9ZKCtJae
         PnUhAD96M99mO020L/pRI+63YeJTtDdI0SJXyS3p5ZaHgP7om0b9iTY1QvzVI1ioeaKi
         PcmrAQNs+4H9QzflbKjPgkFpkM+mIjGLbzRAAJ0BnYpuASxh9iRqxbMSIF14UaPKqLHf
         Wafl1iThijpocCHtA3Qjln6AuVaHlN2M4P3cHXxL4OtR18ZtePpW64CIjyDjdfuSCRVC
         IQUA==
X-Gm-Message-State: AOJu0YzTui/nr/D7/FQCYpOdth2sHdTyHoscJ8eW7HKyBiDERgFZmsFz
	CEGMaVUQG1mcHA/8iFfRTSmzadpgimEOQh0DewYDaloDrErMGLgvZAKNhg==
X-Google-Smtp-Source: AGHT+IFNgU2iSVUc1JMus124Lw1F6aw9MumvTtcKMk+/DczcjPURTjRIgL4Ood3L3TkjQLB9JVbxew==
X-Received: by 2002:a05:6358:e484:b0:1a4:c509:eaf5 with SMTP id e5c5f4694b2df-1a4c509ecbemr824070055d.18.1719537976647;
        Thu, 27 Jun 2024 18:26:16 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d1f77bcsm318202a12.79.2024.06.27.18.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:26:16 -0700 (PDT)
Date: Fri, 28 Jun 2024 09:26:12 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 3/3] bindings: python: tests: add coverage of
 kernel reconfigure as-is behaviour
Message-ID: <20240628012612.GA3115@rigel>
References: <20240626053808.179457-1-warthog618@gmail.com>
 <20240626053808.179457-4-warthog618@gmail.com>
 <CAMRc=MdcdUJOU7uPY5Yu2dppvOBfLY_QbEuWH8Zdz28Pki7BSA@mail.gmail.com>
 <CAMRc=MfsV3B4SG73GRtusnKfHPtRA7mmQEo0DHRxG_bqYkWNTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfsV3B4SG73GRtusnKfHPtRA7mmQEo0DHRxG_bqYkWNTg@mail.gmail.com>

On Thu, Jun 27, 2024 at 05:20:13PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 27, 2024 at 5:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Wed, Jun 26, 2024 at 7:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > The kernel's handling of reconfigure with default values, as is the
> > > case for providing a None value as the settings to the Python bindings'
> > > reconfigure_lines(), resets any flags set to non-default values when the
> > > line is requested to their default values.  While the flags are cleared,
> > > the kernel makes no corresponding change to the electrical settings -
> > > though subsequent calls to get and set values will apply the updated
> > > flags.
> > >
> > > The tests for missing or None settings are extended to demonstrate the
> > > issue for active_low and drive flags, though the issue applies to all
> > > flags.
> > >
> > > The tests fail unless the kernel is patched to ignore reconfiguration
> > > of lines without direction set.
> > >
> >
> > Does it mean the kernel patches (at least the first two in the series)
> > are meant to be backported?
> >
> > Bart
>
> Well, that was a stupid question, they both have the Fixes: tag...
>

I split them up and added the Fixes in case you do want to backport
them.  It would be good to backport the second as the Python bindings
now become the first use case I am aware of that uses a directionless
reconfig for subsets.  It would be great if that always worked as
expected on stable kernels.

Backporting the first, for uAPI v1, is less pressing as I'm not aware
of anyone actually using it that way, but your call.

Cheers,
Kent.

