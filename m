Return-Path: <linux-gpio+bounces-10771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3598E8CB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 05:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC1191C231CA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 03:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E35F1E481;
	Thu,  3 Oct 2024 03:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Prgno/vA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DB8F40
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 03:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727925904; cv=none; b=lrgqye8VJ4aL2wsDyznmBSxTk1aZT4Dv3LKlomu3v8lm78B9dIXppjjeOoXEN19ig+sa0t9GDY8gYvdS40wTHnt5ZG6IIOvILmsXV5sw2M+aPeY/51AAuKVSpgZcKjF1DcCIGmPgcuh3x+1o51+pojCBXwov+fHtCLiN3JlfHBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727925904; c=relaxed/simple;
	bh=jU04ggkyPD8X/pIW4JoUcd/IcY40WUFZrJH4NWH+GQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lj9gLR4UTGgKrvuwjN10kwaP4+jNLsFErZbFq9W4AOiNJaH/RKHVae9NVvxho8oWXrvhp0MLnYTsOQf3tOZWeSqi7XowMNnIbpS3p1ErmxVgbtuu9uSnNEZYSSx65Xfp83Jm7gEK5xKWf9vO8WV03EUiY84ZAuBQD5N2S5luR2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Prgno/vA; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71dba8b05cbso512019b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 20:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727925902; x=1728530702; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jU04ggkyPD8X/pIW4JoUcd/IcY40WUFZrJH4NWH+GQ4=;
        b=Prgno/vAI5cpwxTU3E2vpByTnrMqHrxD9OWnVuQA7bphHGomJ4dNJmKHJfphY5Xinp
         qqdhYgnY2KjBeW+pqFxSnJWPVPXDlOVXk00OqkqBa80/kiUMXqwLRGyX+LncRA//nPAe
         qpepZb1VI9PIlLORbp/76x2uvop61LfbqeF7uWqYVCSl/QY2zTrhO7THEnqzJjkkbZKs
         9fdO3RhzVTY1Ot0Ad+uz40J3yYAGDYqgzSEYAz61VeM23X4ZLCjruYkxVTySwZDfasKa
         Qkw6ggutbiPtlx9vjxqJH4+2v4ChuJ6b91IZWFmisR4mNEa70+q0JGOkMsvas2VHrvoi
         aKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727925902; x=1728530702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jU04ggkyPD8X/pIW4JoUcd/IcY40WUFZrJH4NWH+GQ4=;
        b=jACLrLkNaog3mlk193EkO2jGf0L0Gy1TrtefK97eEUzREpGgjsSPW2J0rog4QHhRZv
         zrMYd8Xyj/7MsdRmJz40Vtz2ExwyYJS1URSfdVRFCBSlMtI4ZkGZUJIVPU3wmkHSzog1
         3udDGQ69IfRJRSnQ9z9qmF8QFBI69Bi8jUNd0TFGKqXyvrmDeDIdNqdhFcbTyzZ9t+U0
         vLI5XXQ7B5YK4l16uG3nzo4DUfDxYdcBItFNhSFDjgNLlgqgvUEyRYogn9sWDtMewyCF
         cBKeZpPvOfaFsQmAUBDGmTC5h2A2nMKUhJ6QLPBXDqYDENjLujARidI+EPI/3fd0g6kO
         Ww5g==
X-Gm-Message-State: AOJu0Yx7k9qcehW5TQBR4Wxd8gNd/qmDfCVfjKbc+B8T/VZPaKx/enjs
	V/sEZH46pjNpLtcfiuDJ+cgr3Gts4hL2hz18FEKRpKxBb8DDPSB3
X-Google-Smtp-Source: AGHT+IG+4VJiCA6Ku3RwuBN5Fe8kqPz8ZD/b8jqc3now4NJwK0lkVDoXuHpjn0zdcEWC8rdqbfFkcA==
X-Received: by 2002:a05:6a00:1396:b0:717:8a87:7d02 with SMTP id d2e1a72fcca58-71dc5d5cfc2mr9254443b3a.23.1727925901987;
        Wed, 02 Oct 2024 20:25:01 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8be6asm275408b3a.78.2024.10.02.20.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 20:25:01 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:24:57 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Fazio <vfazio@gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2-rc2
Message-ID: <20241003032457.GA63612@rigel>
References: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
 <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>

On Wed, Oct 02, 2024 at 07:50:04PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 2, 2024 at 3:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > I've just tagged and pushed out the first release candidate for libgpiod v2.2.
> >
> > It's a big release that - next to an assortment of smaller
> > improvements and bug-fixes - brings in a big new feature: D-Bus daemon
> > and command-line client together with GObject bindings to core
> > libgpiod.
> >
> > It's in good enough shape to now focus on ironing out the creases and
> > make it available in the following weeks.
> >
> > The tarball and git tree are in their usual places[1][2].
> >
> > Bart
> >
> > [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> > [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
>
> Well, that wasn't very good, rc1 had a build issue in the tarball. I
> had to fix it up and release rc2 which now builds fine in yocto.
>

I'm trying to do a build without any glib related targets:

./autogen.sh --prefix=/usr/local --enable-bindings-python --enable-bindings-cxx --enable-tools --enable-tests --enable-gpioset-interactive --enable-examples

but I get:

checking for glib-2.0 >= 2.50... no
configure: error: Package requirements (glib-2.0 >= 2.50) were not met:

Package 'glib-2.0', required by 'virtual:world', not found


Why is glib now required?

Cheers,
Kent.

