Return-Path: <linux-gpio+bounces-16099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D79A37974
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 02:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E940B16D5CA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 01:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B79DDCD;
	Mon, 17 Feb 2025 01:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="OdCRoxjZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC5D2FB
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 01:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739755088; cv=none; b=AxvYluWMRbf3wH6rkNJlYNsVgVtyZlMtQcsRWx7Oa4FQww/F/Fp7/eszcYegGRFAx/QbVrC85dxKruqK9vTIizBSrPPvefR5Ug5wbcair7SngG0yYW0MWv7Jhn/GB09UdvNkX8lY5LIWbNsMiJH21zjo0j/pqwqWVntamrAK6Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739755088; c=relaxed/simple;
	bh=7f407Lo2g3gsncGdxdUhAy8BgEsSWpHxtWAdpdhjSpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUbe6CGtLeYFCR0366OnGrPaK9LTOoVn8sY7XRrZmX9UCR6UtKJIl4INh5rDgtxtQn2npNNqmcbOkkucbQ4bTXflbQj+0qzMbSDQvNTnubJFoSSbSarZuV2p56mShfrPuDqSS1Ay7KoCQqRrIqpi/rZaONPWB2xwEIhJCOm4mys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=OdCRoxjZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C14793F175
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739755082;
	bh=ui1flzHXiVuKwiE9omlY3oi6AgKrvot52UwxHm2SiEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=OdCRoxjZQI+LRl6v8cbj4EivkottCCxIYNQg8HnDWfzct3vN5T4X085lVxJnmCxXR
	 PbblE8XT4WsRRjodiiVV25/T9LY/cPOaOpxxhhRWYpA/UMifcCp8Hx6pgaMSOTVByT
	 ZJqjv5Son51K1m7GQqGXPYqyL584yk4CR7OM5CZi3DiGT81IIFzpgfQf5Wzv4+rtMR
	 d2qY9SGrgg07qi+BESFPZspjCaCLbE34vp1AA1QpnnPxyxzBE03HSI92KVl1YOTKr/
	 dP/j1SmEQqWSiaxbQgB/sckmmmuJ1Q5cVP432HcMfncTjl9OzFZsqeEjX9uM0vVZ+h
	 FGU1p0McGOzwA==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-221063a808dso24025865ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 17:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739755081; x=1740359881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui1flzHXiVuKwiE9omlY3oi6AgKrvot52UwxHm2SiEk=;
        b=B1pN08SmTKehg+nKTL5f3Gb094p4sX5zgyu6yFA6Fc4Ic25GRhVGgoIbvkOkhpe8y7
         gx2jZYojRBloJCAs91BuQ8ZarEeGQmG1S+9hW3ClnFSrCFYjkeWxdl2r97gozURKlox5
         7xBGsm5cqzsknuyqtQShwbWF1epHaPbbK5YfF6BX2DrTcoL4yKv/MgmLTsHcF5vlKJjZ
         c2+65ihQ4K3HkUke/1HzkYLlXpa9lPAcNdLf/JlcB2801h/pbdZbZmjO8+5GPtMLlSuy
         /n/ACQRkA5eT3Dg9kczzQeJ3VC0P04X+3T52j6Ebm47RTd7JPhrI9qnvELfN/itRjohG
         eQ8Q==
X-Gm-Message-State: AOJu0YxXlhmyb5w5YG9trV99S7IpJP08FpK9h63GfpxXtSud83NsNbue
	DByR748nkzRJgmLAOPTBjxvL7WCt5a6YbYwfezRDhcJT8r5bozduQgHQYNWhU4gFzoSs3WeUHyT
	Zp/+GIFXfyw5nneGf/tGP6mLm/dE+UdGx7n3CaKNum35g5ep3PHh9hV30Ol8vE3OVng5en5nxWj
	w=
X-Gm-Gg: ASbGncukCBHH1PO5xNCZ7kD9PSmJJGJ8oDERSNKMiheOznyt2hTd6dKK1fbuyJtfOI+
	Y0CXbkUZf26Qe4kGCVAsS40V5LLBkf9ECA9wOCokREib9NUFLsdTF/H7OjrquFSinoIX/QKTDlZ
	g0G1x9JVSk0t+VaeHwYku+sPJWFC+6Z8S3Oa6AvVYA+4IqS/bc3S1JGPEAwGsquKn7rvBToZ/kp
	rVJQhkXHXW8ht+rnTZTreDl+J9t0XI7XEn1mMf+cIMchCvvWiBGtLfw+DltRs/ljtEDj2LP3Z85
	O8n+450=
X-Received: by 2002:a17:902:e88a:b0:220:cd13:d0ec with SMTP id d9443c01a7336-221040cf8admr142170185ad.48.1739755081127;
        Sun, 16 Feb 2025 17:18:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHSeCB0jEBp3IuDtsx4DIWufoGram6CvP+4Ft237RAu6sGc7Ua4Wjn+A68RGMCSDFsWk9J+g==
X-Received: by 2002:a17:902:e88a:b0:220:cd13:d0ec with SMTP id d9443c01a7336-221040cf8admr142169925ad.48.1739755080840;
        Sun, 16 Feb 2025 17:18:00 -0800 (PST)
Received: from localhost ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556f97dsm61021755ad.172.2025.02.16.17.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 17:18:00 -0800 (PST)
Date: Mon, 17 Feb 2025 10:17:58 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/13] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <dc2w6gxdp3rhlhy6hvwocp76zdjh4jhdljhoijbub5q76f4xgw@ulfvg2s3rvub>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
 <CAMRc=Mef-cg_xt_+mEAyxY_9RfK4=qWEbt_GebeT2mu_8GWVxw@mail.gmail.com>
 <qw5epzoexlteotpuulafg4fyjatlsjjko3ldnzjezoumhodgko@a72wjsaw6fgz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qw5epzoexlteotpuulafg4fyjatlsjjko3ldnzjezoumhodgko@a72wjsaw6fgz>

On Mon, Feb 17, 2025 at 10:07:03AM GMT, Koichiro Den wrote:
> On Sun, Feb 16, 2025 at 04:56:59PM GMT, Bartosz Golaszewski wrote:
> > On Sun, Feb 16, 2025 at 1:58 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> > >
> > > This patch series introduces a configfs-based interface to gpio-aggregator
> > > to address limitations in the existing 'new_device' interface.
> > >
> > > The existing 'new_device' interface has several limitations:
> > >
> > >   Issue#1. No way to determine when GPIO aggregator creation is complete.
> > >   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
> > >   Issue#3. No way to trace a GPIO line of an aggregator back to its
> > >            corresponding physical device.
> > >   Issue#4. The 'new_device' echo does not indicate which virtual
> > >            gpiochip<N> was created.
> > >   Issue#5. No way to assign names to GPIO lines exported through an
> > >            aggregator.
> > >
> > > Although Issue#1 to #3 could technically be resolved easily without
> > > configfs, using configfs offers a streamlined, modern, and extensible
> > > approach, especially since gpio-sim and gpio-virtuser already utilize
> > > configfs.
> > >
> > > This v3 patch series includes 13 patches:
> > >
> > >   Patch#1-7: Prepare for Patch#8
> > >              * #1: Prepare for the following patches.
> > >              * #2: Fix an issue that was spotted during v3 preparation.
> > >              * #3: Add gpio-pseudo.[ch] to reduce code duplications.
> > >              * #4: Update gpio-sim to use gpio-pseudo.[ch].
> > >              * #5: Update gpio-virtuser to use gpio-pseudo.[ch].
> > >              * #6: Update gpio-aggregator to use gpio-pseudo.[ch].
> > >              * #7: Add aggr_alloc() to reduce code duplication.
> > 
> > Please don't ram this new functionality into an unrelated series.
> > Split it into the gpio-pseudo code, factoring out common parts and
> > converting existing drivers, then send the aggregator series saying it
> > depends on the former. Otherwise it gets way too complex to review.
> 
> Ok, I'll do so.
> Thanks,

Should Patch#2 also be split off into another submission?

Koichiro

> 
> Koichiro
> 
> > 
> > Bartosz

