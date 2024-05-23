Return-Path: <linux-gpio+bounces-6582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB698CCA1F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 02:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584271C211CD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 00:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C152B17CD;
	Thu, 23 May 2024 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhPuZUyB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D9415A8
	for <linux-gpio@vger.kernel.org>; Thu, 23 May 2024 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716424363; cv=none; b=Tu2fotM3XPu0bGD1LLawRqQdK8O+6QWct8w9BbP3ZZjgPmgaGZDyZ8BIjBtxdqSRVn0jAAyk/qEQAkeQ2/5ilKbw0LOF2a00xcNPdsBofX76ZTXvFSJieOGy/EGsmW9NuydwE0BP12TeVvw7p2OiaGpPifFj4YNZcbInohpIuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716424363; c=relaxed/simple;
	bh=MW8sJrYdMqK6xUp2hsGjQxZl2fLShSr7bmn4Wgb9vlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOCAleIKknhKnaJ8dbm9yrAP33SOCop+s2pVt4VqQp/PkPiniBE9z7ctP1lHhRDOhOGSaFP84p7rGaObpunyjb3Au++jB8rbTewUybJHoTOwr5CEZm/6xEfA22mI5nmcomfAMuwHTz2cYjNh4irvCSfpFcYzlc4QygKNTd3wfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhPuZUyB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee7963db64so50620805ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 17:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716424361; x=1717029161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AXVAZLvLLoP86wOZGHpXGLDbq960vxLQu0B2j2UOyDc=;
        b=XhPuZUyB48k6tQzK26DkagsEK4j6MFOlBjhORCyD2JQblRTTvm0u2YOHD8cqm9Br48
         EUxtp34lyNpGYdbEYG97Aq4NYRQCKqmIWejoCi0m8izZWSgnJHj6SwsJZnCr7QzcsDi7
         Z7UASgbIElqcBmoo5xii341LhRzsuNj2/FP9YQ+dIAiNMMMEj2XeHpLEaritxPVKO8L+
         LIZGDZHnH6LVx6lOxR2Q2FsaR8bspjKPpZePbVLBuCl72wK2g3A06By6uyWX2Dyr+WOQ
         k7luiRVX9Rc8jH16HULayr4Tbe+fQ2zk4dYHUJj0Toij3Lk5IeKW5GmaXZATuHAK3Z7g
         4p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716424361; x=1717029161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXVAZLvLLoP86wOZGHpXGLDbq960vxLQu0B2j2UOyDc=;
        b=Kv4KtWdhjavIMEP+7uUq3mOjUqco87IJJgyo0cPoNORnAzzpn0RivIbhHzmmJ/8w//
         RFJjFXvFKHXyOnpFMmn/3kWM3cXXB+590Q1zr6VawGfB1CC7BVgdR2My8Pta92K73uNw
         6QAEzyIRukwWsvM0CzL0OuGEpV59fX3U0+WeEe/y8nuZVhNnhC2PR4jpFUz8txoxv9d2
         WDJPC+m8cqnmZtA0qzU0g+DldO+XPPYg39/moXl+xoCP+ENA54YnVVLbYW0Efa6Gm5ua
         Jh2ptaEagHadkcmT+sGZN3MfK3tAgjXcQ82FngCcl++xIkoPv/WVwFi2gP0/FUG28Ca0
         yA/Q==
X-Gm-Message-State: AOJu0YxlIzRK+qaZ4BqmjT0KoT4djySW1BBpevfng7sKzZ0V/G7sUlbQ
	y2jAzJMMyDZ7jfVOTJ7vpe8N5LnhV4U99iiNoXOxasAQn2YJA0cGIZVBXg==
X-Google-Smtp-Source: AGHT+IHNcEIKxQnLO+ylYjIpb4z9FfPtSQ5vCJx4dDSrq+pNaGZ11KaffvoLOX200EylsZlYlaKyfg==
X-Received: by 2002:a17:903:1d0:b0:1eb:5b59:fab9 with SMTP id d9443c01a7336-1f31c9e6f4emr42785015ad.53.1716424361547;
        Wed, 22 May 2024 17:32:41 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bada410sm245081395ad.69.2024.05.22.17.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 17:32:41 -0700 (PDT)
Date: Thu, 23 May 2024 08:32:37 +0800
From: Kent Gibson <warthog618@gmail.com>
To: brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/2] support casting line.Value to bool
Message-ID: <20240523003237.GA15863@rigel>
References: <20240522004643.96863-1-warthog618@gmail.com>
 <CAMRc=Mfd_i7uBBJnxkVbuZkiudxcb2N3rM8RmZGZAG-85iAYoA@mail.gmail.com>
 <20240522235712.GA5330@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522235712.GA5330@rigel>

On Thu, May 23, 2024 at 07:57:12AM +0800, Kent Gibson wrote:
> On Wed, May 22, 2024 at 09:22:50AM -0700, brgl@bgdev.pl wrote:
> > On Wed, 22 May 2024 02:46:41 +0200, Kent Gibson <warthog618@gmail.com> said:
> > > While writing a gpiod plugin for gpiozero (Python), I had to map line.Value
> > > to its bool equivalent.  Casting seemed the obvious way to go, as it is
> > > essentially a boolean, but that didn't work as I expected - it always
> > > returned True. This is the case for any Python type that does not provide
> > > a suitable conversion operator.
> > >
> > > This series adds support for casting line.Value to bool.
> > >
> >
> > Ha! Interesting. Do you think we may need it anywhere else too?
> >
>
> I guess the same applies to the C++ and Rust bindings - I'll have to
> check.
>

Or do you mean other fields?  There wasn't anything in line.py - all the
other enums are non-binary.  And nothing else springs to mind.

Cheers,
Kent.

