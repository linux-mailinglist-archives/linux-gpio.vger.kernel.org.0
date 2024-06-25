Return-Path: <linux-gpio+bounces-7675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE99165E5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 13:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD5E1C2258E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 11:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6A614AD0A;
	Tue, 25 Jun 2024 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtdY3hAd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7AE1494A8
	for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719313798; cv=none; b=A24LVSiA9kfyUQ2J8svm6JVf2CnsJgmbFXhw/fk5pqEFQ3ONF7jqn7iAqk8oUXM98NpJmzkCYzlUag0Ela93/XJdT+za+x1SBJF+LF0cK9zITT6Xof4MitA4w3J2/56L2nfvzn4waP8TH46PE2kUucsEmDXYZKst6DgVpRhYDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719313798; c=relaxed/simple;
	bh=ijInZv3kBS6PECctpB3QlLT9GzKAF6z104r6ZCpQ1hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EW/2OZ8aE0guLbZfawlPigD+w7QiHoI8E+Tk9coJ2JMCqOpnYFaJeXX/4pCz445VeyACtTPubjAq3ICUrsKfGTvqsQ70xsipFs0hXFuZ8lcDiudy2I+/+0vmia4vo8M9Tb7Mx8oJDxJNGd2Pyj/Q5K1+UaQCp3wc45zCX6HIZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtdY3hAd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f9b523a15cso38417525ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719313796; x=1719918596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VOe2cqi1VyOb+MCB12jBvLMKZzyMvDniDj9f34oi8D8=;
        b=OtdY3hAdbGGhDcxwHnYAPE/TnxuVzB92oWG+uDV07su+cHWqpONI+SMUyez6JhPQmW
         Yp0qFRBr8jDGRD4XoscoPZtnDwdsuGH4WeoHwRmwr8sa1vq6lOVJOBKqzcUh1mg08DzQ
         Wg2WchGpWM34uJD4zN5LVFS4hkS5YjULba471gcbBAZ2Zk9qihftJUxPoQU1pzuG3LFU
         mH/LS24xZFsFEn9jtrmQNoLzLXZF3xsTHb0Z+KX2Ui+LzC1Eg9YRyserNfgbVmdiknVO
         LQkFXq+ppMMirpZufbLFshj9Z7qAQRASggsW6NNG6funPSfRyc7HsIoeSSSTBH+i7Bw9
         ba5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719313796; x=1719918596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOe2cqi1VyOb+MCB12jBvLMKZzyMvDniDj9f34oi8D8=;
        b=Lna6rZZmPDt4vjL1BltsGykPjwLQpACuj98Dkp/COQoMapTuXckTkyRYPx4PQ5AW7P
         4MmRdmfcEq41IkIMoQ1r9h7hM9YUVlBL1P/OOhLCxNbIp13XCkPnIm82f9iAUYPBbIlE
         nwZr2l8Y+H1LsnT1l947B+H/gMvhDyxrTEh4YAnw6OgNUdP4p8dZXfawJf/zghejTFHF
         923lqKzyji/3Q2XkPkia8+HMng57NDGj6ianxVUWZNo1ofbjlGXnYZ0H2VsPSMBYTpO/
         tRN4zhrHvLTnh9pJXOWl2zwROcY0wJDI/GPQZoHi9zk6nqmz9UvPOAczLiRMTjlczxpN
         Z00w==
X-Gm-Message-State: AOJu0YxaI4syiCHJsEIyfKsgV7AYakxbV9q9N+Ls6b0RxqyZRhdr1sFX
	kUddBR+xd5PjPFFsX0U8aypoDEz/cm3gNoo8AbkVPNdO/+aaq19b
X-Google-Smtp-Source: AGHT+IFveWDNApJYifd9z+/idennIvd/6Di4b+MJgWaBOMBakZ2tDRftqDVczkgEkVNbGzIqDM2m4Q==
X-Received: by 2002:a17:902:d50b:b0:1fa:1a78:b5a9 with SMTP id d9443c01a7336-1fa1a78b75bmr92985505ad.3.1719313796110;
        Tue, 25 Jun 2024 04:09:56 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d4bc1sm78267125ad.191.2024.06.25.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:09:55 -0700 (PDT)
Date: Tue, 25 Jun 2024 19:09:51 +0800
From: Kent Gibson <warthog618@gmail.com>
To: chuang+git@melty.land
Cc: linux-gpio@vger.kernel.org, Chuang Zhu <git@chuang.cz>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][PATCH] bindings: python: fix LineRequest.set_value
 only works for the last entry
Message-ID: <20240625110951.GB71664@rigel>
References: <20240625011522.1470733-1-chuang+git@melty.land>
 <20240625105342.GA71664@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625105342.GA71664@rigel>

On Tue, Jun 25, 2024 at 06:53:42PM +0800, Kent Gibson wrote:
> On Tue, Jun 25, 2024 at 09:15:22AM +0800, chuang+git@melty.land wrote:
> > From: Chuang Zhu <git@chuang.cz>
> >
> > When multiple entries are requested using line names in
> > Chip.request_lines, only the the last entry is added to
> > LineRequest._name_map, causing a ValueError when trying to use
> > LineRequest.set_value on any former entries.
> >
> > >>> import gpiod
> > >>> lr = gpiod.Chip('/dev/gpiochip0').request_lines(
> > ...     config={
> > ...         'LINE0': gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT,
> > ...                                     output_value=gpiod.line.Value.INACTIVE),
> > ...         'LINE2': gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT, active_low=True,
> > ...                                     output_value=gpiod.line.Value.ACTIVE),
> > ...     }
> > ... )
> > >>> lr._name_map
> > {'LINE2': 2}
> > >>> lr.set_value('LINE0', gpiod.line.Value.ACTIVE)
> > Traceback (most recent call last):
> >   File "<stdin>", line 1, in <module>
> >   File ".../gpiod/line_request.py", line 126, in set_value
> >     self.set_values({line: value})
> >   File ".../gpiod/line_request.py", line 138, in set_values
> >     mapped = {
> >              ^
> >   File ".../gpiod/line_request.py", line 139, in <dictcomp>
> >     self._name_map[line] if self._check_line_name(line) else line: values[line]
> >                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File ".../gpiod/line_request.py", line 82, in _check_line_name
> >     raise ValueError("unknown line name: {}".format(line))
> > ValueError: unknown line name: LINE0
> >
>
> Rather than including example code and the error, put this, or similar, in a
> test case to both demonstrate the problem and the correctness of the fix.
>
> And, as well as describing the problem, you should describe what the fix
> is that you have implemented.
>
> The change itself looks ok to me.
>

Oh, and wrt the subject, the problem isn't specific to set_value() is it?
Any function using the line name to identify the line would fail too,
right?

Cheers,
Kent.

