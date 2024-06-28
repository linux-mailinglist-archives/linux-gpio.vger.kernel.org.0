Return-Path: <linux-gpio+bounces-7781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F591BCC4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 12:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAD3B1C20EBB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 10:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CAE15572D;
	Fri, 28 Jun 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdFz0Jmd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91853135A4A
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571448; cv=none; b=XFuyA3pICCDKVApDHE49b8/Oq0WUgoaiC6DB8sN9fmgEeGPlQsdIEGURa5yxZrOdDDLcIScScwDTA7CV7rvDRdTY9x/sI6UMq09R0WWcP0pCcUv0LBf0+/WmEC7kUrTjF6Y07nPvY7K4qfTkx55Q6cTlsuzg0zgNiQzQX6mAJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571448; c=relaxed/simple;
	bh=8HdVcyCB4n7Rsfjel7VhCRQj8lVLmriOsHO31myg+oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJTkY1aOeUuhb+prfPuIBfA0NZ2H9gIl3WKzzAOrxsoCywknzJNTh05EJ3senf1u9OVrXQMEKiEkipWqGKv/AswduULQaQ0LEJrexQs6GGVD+wg/nfBOaKel7fip2TRHj2ENZUT7MoGmQBPeomtjj5TMPUpN5QXz4mhbeQyRTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdFz0Jmd; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c92d00059eso238170a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 03:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719571447; x=1720176247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmKO6hJOSAwVSQBYb4oVAk95jp834oKGRYoWU/1z9Og=;
        b=NdFz0Jmdr4WYrdI8A8apNktA3PFodLH2Zv2ExdperCK9tOfcZzuh+dtqq6VeaAQLCg
         upDKWqd+i/K5VsGCcwnvmjkRNbPAHIHY/T2So5dgpfpwPdd7Jx9h7icQpp1SxBrOUYyZ
         BmC5MZOfu76h5q0Fw1enhwUCtwzG1TGcqRUJDZcuLS5wIA57RxXd4P7JaXpUJjuSeg+C
         Z+jbUZlXUVxMOFYVvzzXRP6PI6n6vQ/Wc5G4ahflz1Z36T8ZDu/nyGPEJIqW36Xw+//D
         KjnT+dQtPJv+RBMpTGhKXn0GwiOFTw+Ke46RfG2gNZr8+zP6ZVcc1Ah/SwAqAS0VXRrU
         iqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719571447; x=1720176247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmKO6hJOSAwVSQBYb4oVAk95jp834oKGRYoWU/1z9Og=;
        b=ZBVBwJkL/k+n43dMWc/Nlw6hGnM2oe4Y3A9yQxeJiFtCjI4JhWC6te1YuwEEQg0t3o
         DJXFz1ubeACglG2h4yyO8PNG2DGEEabsFPkTxPNNmXnLuvUGrG88+EAGAvM7fJMJItD8
         t+BAXFXySuYiKFrrS+kx05L7mAXMOP31vrF27yxZija6RRFo4pF+Sy4mxB+zwqO5qcos
         hD0QH3aM+X54lrT9Z6MI6DlLMTTYaC/tBJb3XnaX5nQGqvbkACfshJbbxUdkXoWWJQMj
         CmJhVXIwKPLGx31kSkmJohoewLdUOauIRSxUgzE0q13bHFhI8DZ3m9La7Noe9ID/5/lg
         nhRg==
X-Gm-Message-State: AOJu0YwRfvr94QSxiy03oR3CwHv8GRO1JnmTrcqkO5hkNVMcEW7fS1YK
	vDaP66eZmKPojMl0fndNB7v3ryUhJh43miHSHqOWSf0ZMV+MbuiPGnbDhQ==
X-Google-Smtp-Source: AGHT+IG0TerWO1YgiKaIArrzjE/cuCaUZk6RMzr56MvB6xIZ+gzIuF6UJIKTxps+RVlPL5GbjhyZ+w==
X-Received: by 2002:a17:90b:1643:b0:2c2:f81f:f97f with SMTP id 98e67ed59e1d1-2c861485fcemr13138173a91.48.1719571446648;
        Fri, 28 Jun 2024 03:44:06 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce73e34sm1303091a91.30.2024.06.28.03.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:44:06 -0700 (PDT)
Date: Fri, 28 Jun 2024 18:44:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Chuang Zhu <chuang+git@melty.land>
Cc: linux-gpio@vger.kernel.org, Chuang Zhu <git@chuang.cz>
Subject: Re: [libgpiod][PATCH v2 2/2] bindings: python: fix line request by
 name with multiple entries
Message-ID: <20240628104402.GA57270@rigel>
References: <20240627153103.594107-1-chuang+git@melty.land>
 <20240627153103.594107-2-chuang+git@melty.land>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627153103.594107-2-chuang+git@melty.land>

On Thu, Jun 27, 2024 at 11:31:03PM +0800, Chuang Zhu wrote:
> From: Chuang Zhu <git@chuang.cz>
>
> When multiple entries are requested using line names in
> Chip.request_lines, only the the last entry is added to
> LineRequest._name_map, causing a ValueError when trying to use functions
> like LineRequest.set_value on any former entries.
>

Chip.request_lines()

> This patch fixes that by moving the required variables to the correct
> scope.
>

Use imperitive, "Move the required...."

> Signed-off-by: Chuang Zhu <git@chuang.cz>

Use the same address to sign off and send the submission email.

With a multi-patch series you should include a cover letter that
describes the series the changes between versions.

e.g. here you have fixed my review comments, but also fixed not moving the
offsets list into the outer scope.

Cheers,
Kent.

> ---
>  bindings/python/gpiod/chip.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
> index 19c62cd..55f0c3e 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -279,11 +279,12 @@ class Chip:
>          else:
>              mapped_output_values = None
>
> +        name_map = dict()
> +        offset_map = dict()
> +        global_output_values = list()
> +
>          for lines, settings in config.items():
>              offsets = list()
> -            name_map = dict()
> -            offset_map = dict()
> -            global_output_values = list()
>
>              if isinstance(lines, int) or isinstance(lines, str):
>                  lines = (lines,)
> --
> 2.44.0
>

