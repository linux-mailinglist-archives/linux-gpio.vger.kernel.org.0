Return-Path: <linux-gpio+bounces-5263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E401089E676
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 01:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C04F1C211EF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 23:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FEF158DDC;
	Tue,  9 Apr 2024 23:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdqvkwNN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C5158D78
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 23:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712706741; cv=none; b=XTX1CMK31GS897zlrvO6ooYhBuuALYRRxRBrjNPA2EqYpDbiWbUViXIj7Y1XpobloBaT570Dy3RhESnqhnOINt6tGgFptnk6kaThGvIXaIebLyzrKtgYYmhNX3VmyqIBdsOSqn6c259q58IjDsJiu2yfY6Nr90xnF4IHZFJnl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712706741; c=relaxed/simple;
	bh=IziWYKQxlB2mi1Ih0/ayImKPqWjL1hBL50iB77zjKfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGxZR2qR2dvA0zRMimQe1wTwlHU6m5m1//lQ6ElzhNampJG9mb23Ambjq5P4ytukw601w3H7Tp+EG2n/zs5LgLMt/Y0nzp36O1yQiS6j3DiDUsDokdFGaOWWkfLOyI0jeQSLdQSU7axOpifqDAadlJdUd/ncQLFV4NsKSb9ODGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdqvkwNN; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5dca1efad59so4392423a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 16:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712706739; x=1713311539; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKnmSwKEJsOP6MpcLfZ9Jr1/Ss2Cyq5l1q3As/mnNfo=;
        b=MdqvkwNNtQEdtkBchSO+atqr/vzJzBsyStsEs4YxSXplvpzXR+4lJneU1a2WmxAnd7
         A5uY+kAt4km+lcpMcLUkyNC7Hp96V8aHJU5hhcNXlvwf4CdlXDioraE5sxfXWyThN+jU
         Y3wSXz73+hz+mJj6kA8xoAXw3t+q71bdfbRvxJtqaP2joGcB8EouId0XKZswQhxrKg+N
         EHiaCqGsr/4MLXW5UN6rKjobb9wp8w1XDUZMOYlbtfsis6PKOtKj7IEQueYpVRzj058M
         BHpKw+8Tk00Gxr0kWuJMU2jMQTlKnRJijU5Y6r09CYDx4Gkc97G+VBpZBlCn3pTmK68d
         itIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712706739; x=1713311539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKnmSwKEJsOP6MpcLfZ9Jr1/Ss2Cyq5l1q3As/mnNfo=;
        b=giSidi+BStQf11bgDjDN3nuz0lLP1UAAC64DV4A3VpyiBLXxKSA2vcCT7heQ/pHkat
         O1w64LlXtEg74LuvZAPO6RG42Kbpsy6YU6cDjIHcHXFdT2moKuBjRVcAOannehdVQqUT
         j+/xf3NYWUaylxh6272I4MKJMRilEQUQhw0/g8/qj95nva4zkE9H6LFUG2K2j3UeiWrP
         SvU7Q4Vv8oqvY5+lxivc8zRjhGAYXffzcDbbf93NHtgMMJwLuiUarbvXJdUdUwatYXpe
         Fi3SwnCyY3mvuK0k9blD8DSte7IN/CgMck/75CJMNffPqyWIkYnK5lKVteMO1+M/w917
         58kw==
X-Forwarded-Encrypted: i=1; AJvYcCU3+glDhGdX2RNvib7nenPEVPNjClwRZifU0k/ZBxW6L+zyDVl8OaonFm0SSos2vBGRQBthuInfkDUOjky4TiOZPL8Lpke+j2zfjg==
X-Gm-Message-State: AOJu0YyQxhLLDd18DxQEeE5EonZ/wWNiXRBnsWXXG99ezAcbKgsXr1p5
	uwWkYFbWuMUKmNBRTlIulQO/hmXP1IF+dVh2zXqxyJuyrOLx+oWN
X-Google-Smtp-Source: AGHT+IH7Jq3NzbLuBae4yyBDWkKwPluBIyFn+h5fYA43YRTGKd4c28zYdNYr9z1cOpmohwvrbATa3A==
X-Received: by 2002:a17:90b:8d7:b0:2a0:3dc3:8a8b with SMTP id ds23-20020a17090b08d700b002a03dc38a8bmr958661pjb.47.1712706739513;
        Tue, 09 Apr 2024 16:52:19 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090a498700b002a46d73ebdcsm169141pjh.46.2024.04.09.16.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 16:52:19 -0700 (PDT)
Date: Wed, 10 Apr 2024 07:52:14 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
Message-ID: <20240409235214.GC3000@rigel>
References: <20240409093333.138408-1-brgl@bgdev.pl>
 <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel>
 <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se>

On Tue, Apr 09, 2024 at 04:58:52PM +0200, Gunnar Thörnqvist wrote:
> Hi, Got a use case where a hold period is measured in more than seconds?
> Specifically for a get.:::
>
> I can see a large number of use cases where the time can be hours, days and
> weeks. In my case, pin 17 controls a relay that heats water when electricity
> is cheapest. It is ok to only have seconds as unit but the range must be
> larger. /Gunnar
>

Also, releasing the line after an elapsed time, as -p does, is rather
limiting.
This case is actually better suited to Bart's upcoming daemon,
where you could have some other entity, say cron or an automation
script, command the daemon to change the relay state given certain
conditions, including the wall clock time.

If you can't wait for Bart's daemon, you can throw together a simple one
using the interactive mode of gpioset.

e.g. this script:

  #!/bin/bash
  pipe=/tmp/relayd

  mkfifo $pipe

  trap "rm -f $pipe" EXIT

  # as bash will block until something is written to the pipe...
  echo "" > $pipe &
  gpioset -i GPIO23=0 < $pipe > /dev/null

will allow you to send commands to /tmp/relayd to control the state of
your relay.

e.g.

  echo toggle > /tmp/relayd

or

 echo "set GPIO23=1" > /tmp/relayd

Cheers,
Kent.

