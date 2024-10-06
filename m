Return-Path: <linux-gpio+bounces-10887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA63991B85
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 02:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BDC28269D
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 00:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11884690;
	Sun,  6 Oct 2024 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="WpLWkHUZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BC6EAD8
	for <linux-gpio@vger.kernel.org>; Sun,  6 Oct 2024 00:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728173792; cv=none; b=dNwApdw9ZNsqsNFPIB6ydwvuuTHjUt49Kwiw3RyGAUfhqX849QEqgVlM4kSNTk+SLER11JF0Jz7hfhmKa+dl+QjU+kcfKE4DDP7uiefOHU7oEJ4w+tQ1Naecuy2RDquKX/5h1l3v2xiVy2+/ccqYQqneCxUNyo9HpQrtpujy5Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728173792; c=relaxed/simple;
	bh=QuIwLKNqPP+ajPWxbwQWvOX020O22lVfh87U1YvnI3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWJ/w5Vn3c9W8ZvEAuPxfZrJJT3s7/zyJ9gLF81W1EtzIGLfvQBsECcxQ5xLXApd+lRbWJjtBJ+eW4YeeUWDoOqZ4DXRMCbf7LtNY2kEP+VAVbKNpiYZmAPF2AnweTjheXSgAlldYi/9jpkeUhKCl0DbEkQO7u0BbtSiTuskS5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=WpLWkHUZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20ba8d92af9so24935775ad.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2024 17:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728173790; x=1728778590; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbvkF+qVNDPAW1MhTtQI9sEGEuwlkmBnRCVtfcvykzo=;
        b=WpLWkHUZ3Mc4j7csjVgIvrNKBvDMR0zXoDMp8r+G0bRWb0JgB75T8e8QLyJb2vDz7U
         yGDqttQ6vp4JyWbkvJWMjWu95UVhfLPaZ1YC53VkKUO1bFQzn5aUptd5Qo1e2Yd1Clej
         gNd364JVftuXS3nWwIT0B01o2jMGoVgyanpUvO3k2yhW188UbtBGG1yVoI4zChR5GQfP
         WCuULPpISX7Ct6kpgIP6mZ+qN5f1zEFbpVt90dAboiOy6DCtYLJUf3DHDgi4ylP9dA6Q
         9juCoHmheM4706RM8HFaJsTqS+iODRY3TMVOhpwp7ywVjGUH7HJ/av3VhmtR42jx1O6g
         M8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728173790; x=1728778590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbvkF+qVNDPAW1MhTtQI9sEGEuwlkmBnRCVtfcvykzo=;
        b=fTmmAAybeefSbfNz9VAX535/1blTtA4iHIlJzjkzBmlmLXKHrf5iVOfk0LEzcRzsT8
         lqIiDjfnAr1BuBAo7S5aoDYVkmaXoWOXiB7VveNDjD4k2pN6OWbyDjOWDC58/EZG2pmE
         OftlWjxPflB7HohabxD55fXy5u8UYXe6YE8LdzNKPzJSzqZ+0HReSKi6dILTxuyl5Yv7
         6+YCMY3CqK28Lc/yhcF6gOjY76J+jdsBzlJ69jb7L0K2CfFa0qnAVQ99s65j1bSJ6zkF
         4vmTeW/jlataPwpT0UcJQEa91Lqldi58nYzjAnx7u8jg97eATjr5zEDNEVOvXu6XwIio
         udmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMwswGxxbkbGuaxuaZBqM5ELwVvfemA4BBFHJc96locoTQFtP+o1+Ffpu0WFNpYVAkYi8sYz3b2+oP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyis9NALN7zF/8eAJx4JYgQcYLUH4ECIBLN6E/XakmsAnj7pdxx
	IzSQDqhbgS+hurMTuVhuVbco5BKm0Jb6+XF/OLES7/wLsapmE08QLR0e9dP684IR0ycKZcgrn3K
	k
X-Google-Smtp-Source: AGHT+IFAQJF8DuIfGajcjfoBIMX8leJdlJUQ6cf4GvstJkpqWV3ZuWMQcdhJ5PYEsYlv3v7IZ8uRZw==
X-Received: by 2002:a17:902:e747:b0:20b:7e1e:7337 with SMTP id d9443c01a7336-20bfdf77cb1mr120746215ad.13.1728173789775;
        Sat, 05 Oct 2024 17:16:29 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138b0f48sm18190685ad.25.2024.10.05.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 17:16:29 -0700 (PDT)
Date: Sat, 5 Oct 2024 17:16:27 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <ZwHW27ZuZrtBm56q@x1>
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
 <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
 <a42a738a-b52d-4ff9-ac21-cffd808bc055@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a42a738a-b52d-4ff9-ac21-cffd808bc055@wanadoo.fr>

On Sat, Oct 05, 2024 at 09:43:06PM +0200, Christophe JAILLET wrote:
> Le 05/10/2024 à 21:35, Drew Fustini a écrit :
> > Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
> > thp->mutex.
> > 
> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >   drivers/pinctrl/pinctrl-th1520.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> 
> Hi,
> 
> > diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> > index 9331f4462480..d03a0a34220a 100644
> > --- a/drivers/pinctrl/pinctrl-th1520.c
> > +++ b/drivers/pinctrl/pinctrl-th1520.c
> > @@ -425,7 +425,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> >   	int ret;
> >   	nmaps = 0;
> > -	for_each_available_child_of_node(np, child) {
> > +	for_each_available_child_of_node_scoped(np, child) {
> 
> Using _scoped iterator is not described in the commit message.
> Is it expected to be part of this patch?

Yes, it was intentional, but you are right that I should have
highlighted that. I'll make it a separate patch.

> 
> If yes, the "of_node_put(child);" just a few lines below should be removed.

Thanks, will do.

> 
> >   		int npins = of_property_count_strings(child, "pins");
> >   		if (npins <= 0) {
> > @@ -444,8 +444,8 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> >   		return -ENOMEM;
> >   	nmaps = 0;
> > -	mutex_lock(&thp->mutex);
> > -	for_each_available_child_of_node(np, child) {
> > +	guard(mutex)(&thp->mutex);
> > +	for_each_available_child_of_node_scoped(np, child) {
> 
> Same here...
> 
> >   		unsigned int rollback = nmaps;
> >   		enum th1520_muxtype muxtype;
> >   		struct property *prop;
> > @@ -530,7 +530,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> >   	*maps = map;
> >   	*num_maps = nmaps;
> > -	mutex_unlock(&thp->mutex);
> >   	return 0;
> >   free_configs:
> > @@ -538,7 +537,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> >   put_child:
> >   	of_node_put(child);
> 
> ... this should be removed, and maybe the label renamed.

Thanks, will do.

Drew

