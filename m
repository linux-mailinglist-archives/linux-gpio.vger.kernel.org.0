Return-Path: <linux-gpio+bounces-6568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B27708CC16F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E47C81C214DF
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9184A13DB99;
	Wed, 22 May 2024 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Esi57PX3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122CE1E86A
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381670; cv=none; b=aK3XZxBWrkXFGxzo7pI8HkrWEcBfCd14yNxr94p3DWfZesg7ev37ovbxNAAv7j68DPFIKb/Mjl8nmR8Gh2j2Sx71thYXAN68FMT8Wh9w706HgGOokaCCLNsCpnr8Iym6kqVtn4SijKHhlYYY7+ZOe2364z9Kj8ZKOEhH2/UiPcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381670; c=relaxed/simple;
	bh=2eOfW4QM4l36wngkcxG7EXiq7PBanoqIkAlG8/q8b6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duBXyJMzItZFrenz48Uvnqwef35lbcZYRffS6K4b2fNQUVj03t6+ijF5kHjWAksLe5msrgqxOyaCBpqlEC4vEWhAu7tk2vTnESvBGMRQlu0NE6Y8j/+qzeK5gu5c3kiwShl954KCjjhCI+634wg4v2NfM0KcEysrPSTBoKJkZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Esi57PX3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ee42b97b32so9092845ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716381668; x=1716986468; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m65HUM60wwH32SjStdqi7Qp08dB4WStoEXZDXC9MM8w=;
        b=Esi57PX3YpXUe1mhBt+6M/czdCYl/gICTSVrdF8tDgy4jlL+XPx11EkV0ZmLeUnebe
         P3yEsAZx92fZUxBY2D0U4uxiv3kzjUcmQkB4gQYHUmrUn3oMJarPbXV+q7s7H2CVXuuT
         abtRLsMnvsNZAxXgzTxeeJjUg/1k628vzDKkIjPV5iwjTMEBJ5qWctaOole3maNv1sUl
         HZmP+fgl+NHzQeBTJZrujLRy4femfZgX8z7NGLXNdzW+CxeKhzW3EEXq4CzKGpFufpVW
         C/ok8h7VVaFdHR4P2MvxPq4hC+zisz2y9K5ueyJlv1CN2AmkfGtwh9Nggfao9xCcXNYQ
         kZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381668; x=1716986468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m65HUM60wwH32SjStdqi7Qp08dB4WStoEXZDXC9MM8w=;
        b=q8MpzJ1VpGMd63eLCBwmw4Uq8SM+PUBGt0a9wQRDMtd/eFaISzoR86k+FnuL1PMMqE
         6/tG8PKUzO5xQPbTTJic6/5FU9iwUwL6BpGF7sjkyntVVl1QY/gwBlZAACub0szVqUBK
         t4PxRAPJkxsYmnykuEuRW5T3mmhmgQxgV6UyKYsgH0XZU4v9k3EXH6R1f8rVi8ewymku
         ZJYFkfvm0zJlJtaY0zaccZ1QHXwYf8lmkxuLphKYCxUc7NRaUWVdlQe78Noi1xpcqtzV
         AsUoujRjM70OlzjGXP+diziCKUNk5qb1fsYyYJ3iGJ7HQQI/mwQOCuAGQcwk1z//xEme
         tx9g==
X-Gm-Message-State: AOJu0YxCteuY1nMhk0mQPK4ELKLwjHvQF3eUSsSq4fwgwP7I0S2I8AE5
	uFhiQXzfCrHRvYZfBK+O9Xs+6OySLdvSOq6dOiPbxTY/tEAiWIOT
X-Google-Smtp-Source: AGHT+IHlrhlf3Zxf8YDxJ+5nrzSgJMV3ue+ktisHFVOPXtaHyTMV0qzpSkQPEk2+jJnXrL/PiULAYg==
X-Received: by 2002:a17:903:80b:b0:1f3:704:82e7 with SMTP id d9443c01a7336-1f31c98e47dmr14189855ad.18.1716381668241;
        Wed, 22 May 2024 05:41:08 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d44e0sm244290945ad.4.2024.05.22.05.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:41:07 -0700 (PDT)
Date: Wed, 22 May 2024 20:41:03 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240522124103.GA172631@rigel>
References: <20240513101331.GB89686@rigel>
 <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel>
 <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel>
 <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
 <20240515141436.GA349711@rigel>
 <CAMRc=Me9ffciaXnOKE+ABLDBVbSRzTAEHRVzpLk641eocF4q8g@mail.gmail.com>
 <20240517123732.GA423787@rigel>
 <CAMRc=McuzzzRF8ttRKZWouayF250p8V2OXwmyjSrKOYe95Mn+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McuzzzRF8ttRKZWouayF250p8V2OXwmyjSrKOYe95Mn+g@mail.gmail.com>

On Wed, May 22, 2024 at 12:59:39PM +0200, Bartosz Golaszewski wrote:
> On Fri, May 17, 2024 at 2:37 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> >
> > Oh, I agree - that makes total sense.  The direction I was headed felt wrong,
> > so I figured I must've misunderstood what you meant.
> >
> > I'll re-organise it into a separate unit.
> >
> > Does that unit have to act through the core API, or can we give it
> > access to the internals?
>
> If we can avoid it accessing the internals, that would be awesome.
> Unless you hit a road-block, please try to keep the core separate.
>

If you want the ext functions to store config then that would rule out the
shortcut constructors returning a gpiod_line_request.

I was thinking that the ext could be a friend of core and get access to
some things not generally accessible, in this case allowing ext to store
the config inside the request.

Without that, the two options we have is to rebuild the config from line
info, which you don't like, or wrapping the gpiod_line_request and have
the wrapper provide an accessor to the contained gpiod_line_request if
the user wants to use core API, which I'm not thrilled about.
But that seems to be the only option.

> > And where do you stand wrt the idea of adding a config pointer to struct
> > gpiod_line_request itself?
> >
>
> We'd need to make a deep copy, otherwise it could be destroyed and the
> pointer would be left dangling, right?
>

No, as the config is constructed and added by ext - the user can't actually
see it.  It would only be accessed indirectly via the ext functions.
If using only the core API then it would always be NULL.

Well unless we were to provide accessors to make it accessible to the
user, and then which way to go would be open to debate.  There are other
functions in libgpiod that pass ownership, so copying isn't the only
option. I haven't put much thought into that though, as I wasn't planning
to go there.

Cheers,
Kent.

