Return-Path: <linux-gpio+bounces-6635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8748CFE09
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24B35B23540
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 10:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE9E13B780;
	Mon, 27 May 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmkdqMPZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F4313B5B8
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716805482; cv=none; b=ioz7tcJ95WrbPTIgNNUOeBqo6gomrzcp+Sj3LejuvGF5HbZWCU/UzNFLpbCBZq+9ouP1HwSdadeij7LLEZh+QHfiJIExUgXixDYwpBzKpsM6tjnlZhS1ALSLPtiXa9erkQR/7HvYkfeQZWRYgc5THUkvWhRdwyBudUFVWMdu0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716805482; c=relaxed/simple;
	bh=Jpt5NLQ2ML/kfm90LvL9J6dtfNG5W8GdVkpJMmkv+HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd7V5GIEfYuWXbHMDLwi0t9V5s8D6IqdXQdafo1YRGowpajoQ31kiStBlyaQGGmEmcU7KoFvDF1n1ZtOHQraXUmOrG/40ipdjJ8vmUJwl8RRVdYCOCcpxe7n33Z0k6XNSpE1u7h5+kT/pW3aeE1hUmm7VtNWMVP5KlUPESuYkkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmkdqMPZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bdefdeb545so2963370a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716805480; x=1717410280; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZHMhiwkLXruXuyY1orc0ajLiNbmfJQiTnzfRP0TWJrc=;
        b=MmkdqMPZW3xSTHS3MKqodtEgIlwEuznnUFssvHNG6LTmnrNo4PXWuoTo3rnbUYYNVi
         wLVp7xuAf4XZsvAMR0o9BI18ltdBTn7oHpu5W9YQcTehW9KVvOGw7PIuCp61jD89hv+b
         8j0mMFnnMLCNkdbjMOFLaYSyZwLA5GdI6lzTAVOjSD9uwVXDj25c+mgozWKPc0wjlMJN
         MfLi1hFDknJTSV6BZ+LuOTJqITdjxOcwH3TmW1Jod+GzKEjhznLc8f2rYpUc10ETygMM
         4ISBk2A3QBSFyk+uRjUQej6VK+Nr9LKXUnh7j+VuPptPSVVk6Ubtvlcqt8lYWNql3qYZ
         ewtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716805480; x=1717410280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHMhiwkLXruXuyY1orc0ajLiNbmfJQiTnzfRP0TWJrc=;
        b=nSY3kxpvnLr9sZtu+GBOmQ+cgsbB8QcjVlhUJ1yhxNtx1+OPXa6npmjDi/qn9kiK2+
         ivfPyDBaBg2KHKEeFDGtl06NuaJFu6vvcWu3fL6sDespNzDm1n9mQZcdGS9262HoPkXT
         MYLHaMEbFsOo1w97HL/axBfzANfm0GW60QlUlErn5BHyFWMNgIoGdGx2PxF7qvC4O+rT
         9j55hsxS/zpqLJ1m5HTuewwllRd4vv5aOxid5RRCqk0sfexVrAi+c++u/+v4e1ryenwj
         QegPb9anilfy1ttuprg67U4yS/jfdtnuud/YnXmWh1/leCUv2CgEb61RYn2s+BEzWeij
         yRmg==
X-Forwarded-Encrypted: i=1; AJvYcCVcePUItEeLrVs09xhD2wosPOwhu1BmNX6EBUyD3faWpwPhJEsXeXIC+9iZZdmil0lNnWAAM9L9t6b2xrRSpTpqANq6XmwdZRMpnw==
X-Gm-Message-State: AOJu0Yw+Fkzl6KQiL7Pvxpde+ZMQGrNUcwrdSZUa5Rm5w2BOITZi1UH8
	zql5ocS88DJ0vD+FP8/qlHBezstMjMdVB1omYGsnVaiCvqdSQaZLdcLTRw==
X-Google-Smtp-Source: AGHT+IGMFG2JIxYR8gdh0Ra3gKGYPCXeGkezcLi6ZtCIbh6u0k4/vFk0hX8poxbOhwfsUSymBD5/hg==
X-Received: by 2002:a17:90b:190e:b0:2b1:e314:a5e6 with SMTP id 98e67ed59e1d1-2bf82fbbc38mr4942950a91.7.1716805480079;
        Mon, 27 May 2024 03:24:40 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9ef09f9sm7285203a91.23.2024.05.27.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:24:39 -0700 (PDT)
Date: Mon, 27 May 2024 18:24:35 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 2/4] tools: tests: use $@ instead of $*
Message-ID: <20240527102435.GA61454@rigel>
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
 <20240524-fix-bash-tests-v1-2-1397c73073a6@linaro.org>
 <20240525015431.GA5731@rigel>
 <CAMRc=Mfk_r7v86wfgQgeSGxwVFZkm9SUXw5tFJxBX6cVFAHPUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfk_r7v86wfgQgeSGxwVFZkm9SUXw5tFJxBX6cVFAHPUw@mail.gmail.com>

On Mon, May 27, 2024 at 11:49:09AM +0200, Bartosz Golaszewski wrote:
> On Sat, May 25, 2024 at 3:54 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, May 24, 2024 at 08:03:28PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > $@ does not break up quoted arguments which is what we want in all cases
> > > in the bash test-suite. Use it instead of $*.
> > >
> >
> > I believe it needs to be "$@".  Everywhere.
> >
> > Where do we use quoted arguments/whitespaced parameters?
> > So this is purely about "good" shell?  In that case why stop here - e.g.
> > shellcheck picks up a load more "Double quote to prevent splitting/globbing"
> > and the like.
> >
>
> You're not wrong but I have an impression that this is just a
> sarcastic way of telling me this change is not needed. Could you
> confirm?
>

Me? Sarcastic? ;-)  Well, yes and no, but mainly no.

Strictly speaking, the change is not needed, given the functions in question
are only used internally and we know whitespace is not an issue.

OTOH, I'm fine with this change, but I do think in that case we should fix
everything, to some accepted standard of "good" shell.
I believe Andy suggested the same.  I happened to suggest shellcheck as the
standard as that is what my editor happened to be using.
Happy to go with something else if you have a better alternative.

If you want to apply this series (after fixing the "$@"), I'm happy to patch
that to correct all the other things that shellcheck throws up - there are
lots.

Then if we do happen to make use of whitespace in the future we're good.

Cheers,
Kent.

