Return-Path: <linux-gpio+bounces-1944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8938209A5
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 04:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FAB31F221FF
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 03:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C721371;
	Sun, 31 Dec 2023 03:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaiB+Yhc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881FB138A
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 03:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-35fea35c432so56428145ab.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 19:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703994678; x=1704599478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEQOLWqPQNsrForNu3gwbYeZLsx1Q9qQo0dOUgSvcF8=;
        b=RaiB+YhcuqwJO12/u67T8hgJvLgY6oA1Edo+gXnxJXywZKF4hxOQTwnXQqyKGvdyRN
         gHmauipvbmqFhXEeJ5FHquy8LlIgji76SaS/D3Yggp98vueYyKJR7LqwT7EWPp/5VDon
         WhQNDbJGCSnEgZb5uyT1cDZHNfZV6oUbywo1/uOUokIY235YpNasfy8eb8oqyqjw7/ba
         3tMSMwvwh8b/Cv30YLDiktBenvfZZtdgshzLBsGIjd1OCHNwsF1TFPUWtrsIBX8oIcby
         g3Uce2Wuof4zzms770/LWFeuV/lpMNZxeXdtIwJIDcYb/oESD6CUpkuo+nCcmeVKXiNO
         W3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703994678; x=1704599478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEQOLWqPQNsrForNu3gwbYeZLsx1Q9qQo0dOUgSvcF8=;
        b=UwNord/TrrkHeuVnQbO4L8DGFpAzxa6IbwOuDwGXbrnOuV7kjgeK4bijxEkvjWCPx4
         weS6ZHDa4Am6EcuB8CMehvtO+AozwzDUUjL723ERvUUgVgnZpbqkUsofCQLeYjKtItuy
         ncsqm7EMcyjCwn1/Lr4P59F9yqgmWktJ5aqc0wKppKxZbBtxc1NhW/Xgn2eMKLzJwUkP
         l0JZpRP/e4Bb2clwr/gGulIthb2A0lPJQunMj64wtuz+xvMGq5dEQGI4anm3GHmmGATx
         KLGMDc3rsd2C5NT9vaVMH9CX/CGbPoskvXItIJnipQ8dhQ0vKFUwqWAjMUyDHPwUXzOl
         IW/g==
X-Gm-Message-State: AOJu0YwMMSM/wMkqWIdFu659ApWrxf2K36LXB4vn95jGUOn5qd3hX+IL
	VJFH5YPOo3FICwVWs8UYpaU=
X-Google-Smtp-Source: AGHT+IFR3uDs6zCsiVijHWdOrVsl35QGTDKphLsgvzsTY9BWn+usF+PFtpJqZMF9bacTcqDWYZ/yFw==
X-Received: by 2002:a05:6e02:1989:b0:35f:deea:1c86 with SMTP id g9-20020a056e02198900b0035fdeea1c86mr25532818ilf.3.1703994678635;
        Sat, 30 Dec 2023 19:51:18 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id l2-20020a170903244200b001d0cd9e4248sm17950525pls.196.2023.12.30.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 19:51:17 -0800 (PST)
Date: Sun, 31 Dec 2023 11:51:14 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Documentation question
Message-ID: <20231231035114.GA15400@rigel>
References: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>

On Sat, Dec 30, 2023 at 08:04:40PM -0600, Seamus de Mora wrote:
> Hello,
>
> I read a description of libgpiod recently that I cannot find... (my
> well-organized reference catalogs have failed me  :) I'm hoping
> someone here can help me.
>
> The documentation I read made a point about libgpiod restricting
> itself to GPIO; i.e. not I2C, SPI, PWM and a host of other specialized
> GPIO interfaces.
>

It is kind of in the name ;-).

The headline of the README is

  libgpiod - C library and tools for interacting with the linux GPIO
             character device (gpiod stands for GPIO device)

It doesn't describe what it doesn't do, only what it does.
And the scope of the GPIO character device uAPI is to expose the
functionality of the GPIO subsystem to user-space.

> I thought it was in the libgpiod README, but it's not. Any ideas on
> where I might find this?
>

Like you, I can't even find the brief documentation on the GPIO uAPI
that I thought was in the Linux kernel documentation - the only thing I
can find is a reference to gpio.h itself, which is not very helpful.
Something else to add to the todo list.

The closest thing I can find to what I think you are after is the pinctrl
documentation[1], particularly the "GPIO mode pitfalls" section[2] - but
the whole thing is worth a read.

Cheers,
Kent.

[1] https://docs.kernel.org/driver-api/pin-control.html
[2] https://docs.kernel.org/driver-api/pin-control.html#gpio-mode-pitfalls

