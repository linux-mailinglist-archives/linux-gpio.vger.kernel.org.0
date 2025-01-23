Return-Path: <linux-gpio+bounces-15038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C6A1A513
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 14:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 242173A37EB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 13:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873AC20F98E;
	Thu, 23 Jan 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Izal+Opo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D489020E337
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737639228; cv=none; b=i4JA8NXk95HdzSwvDwQyuJ15dqLFcwqUXqyxgraYFj8DjucGIehqZfGRUKE+4p5XOBgqSSTNRqPQNd4IfPYUk6ZtrbsXwNEap8INDh6F3tCGYEulvXLMJFBlNMSsLysl2klZMkASj527efLE0LQ2+J+r64fxUAcNMlnY8poaVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737639228; c=relaxed/simple;
	bh=Sj/S1FwNo9ZEVTBWmcRnNgSJ0B7pwz1lzIxHnhaZ3Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa4fzSORq1ZGrAr6tcUrNZyQICGK7jh1QYPLFY6WoLIs1ElyZvp1j1YTO1sjrDron/iMnluS1jvxHRCFayje4VtcY9C30aL1sVtRErXYDq0S3KaCPDzC6o2nOb8ymRbaol5Lv++bJch+BS/M6Ko0h/q/iK875rnMY1aNHqnILjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Izal+Opo; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3FB543FB57
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1737638782;
	bh=VFy7EqhRP6yD8QmiA12bqqXA7CErdtXiiQp1UmJ4Pho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Izal+OpoR1wPrHbqQbQoidUIdZHQ7cIcscUUGe/aliEd7dc2L6InrDicaSHOFcwXK
	 KeO9MjWRntvxSkkPX7xHkjP87dgtZga5vWsPJmjrG/Eifw83kEG+Y/4kdSa31lVHlq
	 5LLrrCS32q08JXbX7T21Q38F6dNP7yI5Qgu4sbyQXilgiNICOOUgjIm+FodEL50uJ/
	 H9U25idg5GIGF9Vv76SGFNVvm2zq6xV5KlSQCt9cv4xbJcCNPVkZwtcLs2qxo2Sis6
	 O6+4KAk/By2duYIvdyvfU+//6fbGaF7vgF9Gusrue0LGwMFoOl3kxu3eReZ5HzAC9+
	 XEE5HQIkPpKUw==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so1870744a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 05:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638781; x=1738243581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFy7EqhRP6yD8QmiA12bqqXA7CErdtXiiQp1UmJ4Pho=;
        b=C0kkXG8tWl0FykAjitIySEdxxYGQo35wcPpmSij7kt/mw+GeHPkR0RZ0415DUBgLPL
         6qKr1C6Z17O12bvcLOZntW57kJksa9Oaz89LN6uqLVXnXBE369YKTkscBSSbg59mvnaU
         O2ZIqjhoEHaIbF9YiOrixfWGfBVu0ubFcvWxaS5CNreQjUzmZXGD6RnepaA7M0GHC+Ym
         QoPJrcHRf/II5WMf4GbLG2limq0rYXX/xT0lemsOkNPvFfe7UwSQglcregotCmPo9dFJ
         VcWBwkvi2CQO72PZkw57WYKxv25EwGTok2+ZG67H2437n0OAriBakA+tyZSAMSuwzJvq
         eZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXigKF/yyMWtCUmNgUXf9FhM9AtYqAlJB9hJZyUzPpSnYoUhKdcQJW0YOyBJ5/pZS0/Jg2QuOkowVPR@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUSy8Tf65scfAbNTTqsqFNRl2DjCZ+TJ8LBBlmJJaE6n8zUU+
	W255ZCc3UQmpvZ8QPL3qdK09VxyAQ5MF91argDXQwCGQCiyLZhB7eukIvQDJACZUrBVbB0DN4fQ
	Ang1GEhLhQghvMDpCGJ7XrH4NhRSWP2Wxh+6mJGtxv0EuFbWgTiLI+x+X30jrYpZTckRp29MD3+
	atHgnRSeo=
X-Gm-Gg: ASbGncujdGFqZE6uuLtcQ1iAthdA/5ogb1PPE4gmhFG7inw9hnICAFjUVYaDdZT6Ffu
	nq4hkNQxsGWOIcaBlRGODTJaZTRK0MJqs3ghabgdC/aXxWqu4KrNJRvDvk+odTmX4qFT9gVg9Xh
	LNTF+iYBZt9ksV0aHupCcojh2bmrCJZ+eT5vIOpI0hfDXTigS7egBrTFAas9aG4A2k7U2sMahKl
	9b5k+9Fyw9O4A1Tt0uvoI5z+m/G+k4qfiql6eqPY66irkpO+YqeyKgwU+Y/QxyWxkmgDRk=
X-Received: by 2002:a17:90b:2748:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2f782c73b7fmr40001300a91.10.1737638780703;
        Thu, 23 Jan 2025 05:26:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEicCQNEXlsVGMh27lbDHSZgUxGoFpy2f23AdyxWU6J2xXEKBKjDCHOPQ0PQ9fu+MwjfPKIzQ==
X-Received: by 2002:a17:90b:2748:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2f782c73b7fmr40001262a91.10.1737638780308;
        Thu, 23 Jan 2025 05:26:20 -0800 (PST)
Received: from localhost ([240f:74:7be:1:190:37f8:66c4:a4ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a7df3bsm3956231a91.19.2025.01.23.05.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:26:19 -0800 (PST)
Date: Thu, 23 Jan 2025 22:26:18 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kselftest@vger.kernel.org, linux-gpio@vger.kernel.org, 
	bamv2005@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: gpio: gpio-sim: Fix missing chip disablements
Message-ID: <iyraiattza5sogq4ysmmds2uvenlhnccrdw7vhoizgsu462db3@ouuwrbrznct6>
References: <20250122043309.304621-1-koichiro.den@canonical.com>
 <CAMRc=MfRm02TRJ52CU3iLhsvwd95CBhxmkbebCJ=riiXxsCkyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfRm02TRJ52CU3iLhsvwd95CBhxmkbebCJ=riiXxsCkyg@mail.gmail.com>

On Wed, Jan 22, 2025 at 10:26:27AM GMT, Bartosz Golaszewski wrote:
> On Wed, Jan 22, 2025 at 5:33 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Since upstream commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
> > instantiated device depends on"), rmdir for an active virtual devices
> > been prohibited.
> >
> > Update gpio-sim selftest to align with the change.
> >
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202501221006.a1ca5dfa-lkp@intel.com
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  tools/testing/selftests/gpio/gpio-sim.sh | 31 +++++++++++++++++++-----
> >  1 file changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/testing/selftests/gpio/gpio-sim.sh b/tools/testing/selftests/gpio/gpio-sim.sh
> > index 6fb66a687f17..bbc29ed9c60a 100755
> > --- a/tools/testing/selftests/gpio/gpio-sim.sh
> > +++ b/tools/testing/selftests/gpio/gpio-sim.sh
> > @@ -46,12 +46,6 @@ remove_chip() {
> >         rmdir $CONFIGFS_DIR/$CHIP || fail "Unable to remove the chip"
> >  }
> >
> > -configfs_cleanup() {
> > -       for CHIP in `ls $CONFIGFS_DIR/`; do
> > -               remove_chip $CHIP
> > -       done
> > -}
> > -
> >  create_chip() {
> >         local CHIP=$1
> >
> > @@ -105,6 +99,13 @@ disable_chip() {
> >         echo 0 > $CONFIGFS_DIR/$CHIP/live || fail "Unable to disable the chip"
> >  }
> >
> > +configfs_cleanup() {
> > +       for CHIP in `ls $CONFIGFS_DIR/`; do
> > +               disable_chip $CHIP
> > +               remove_chip $CHIP
> > +       done
> > +}
> > +
> >  configfs_chip_name() {
> >         local CHIP=$1
> >         local BANK=$2
> > @@ -181,6 +182,7 @@ create_chip chip
> >  create_bank chip bank
> >  enable_chip chip
> >  test -n `cat $CONFIGFS_DIR/chip/bank/chip_name` || fail "chip_name doesn't work"
> > +disable_chip chip
> >  remove_chip chip
> >
> 
> Hi! Thanks for addressing it.
> 
> Is there any place in this file where we'd call remove_chip() without
> calling disable_chip() first? Maybe we can fold disable_chip() into
> remove_chip() and make the patch much smaller?

My aplogies for being late.

Yes, there are five places where I intentionally omitted disable_chip()
calls before remove_chip() because the chip wasn't enabled in thoses cases.
I scattered disable_chip() calls only where truly necessary. I also think
explicit enable_chip()/disable_chip() pairing look more clean and readable.

That being said, I'm fine with your suggestion.

-Koichiro Den

> 
> Bart

