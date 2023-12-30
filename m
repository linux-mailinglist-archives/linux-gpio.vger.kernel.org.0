Return-Path: <linux-gpio+bounces-1936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE98203D7
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 07:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AD2CB2165E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5749317FD;
	Sat, 30 Dec 2023 06:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvq8qcbj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA655290E
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ccba761783so53048961fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 22:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703919423; x=1704524223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhEiBpaPSsvDaGOUHDAtFKdNTugQsh1vRm4I0QtLevw=;
        b=Xvq8qcbjYQ8kufox6RN2yMvwfEZI+pM2u+nGgUvPpaTk9fsMJxsZEiWZnhDGdXqeg8
         srf2bFnGkgC/OUb9Xnmbb7GNvlvaSbd6pJBCtTyI8QSBG2y+1KaM2hfM9taC8sw+Z2lQ
         zrsV/ehd3Od/Ng5eZ2M63oghZpVqL/jxLBthTDvayEKEHm2Gwf+/DOQd2pDfJH0TkIO8
         bO6Z/m7X/1DVDUqh+L2tv8l4BH9ThPWUe4dVQWwnvGOEA7IDjSBWK3aoFAK2YIpZyR91
         sXh/lCcmHLtwhPGkEWWwcLnBTLJ6F040uQu+pO8uRf0bgVDoWY5WcWkN1mXx+EctBc+h
         jYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703919423; x=1704524223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhEiBpaPSsvDaGOUHDAtFKdNTugQsh1vRm4I0QtLevw=;
        b=o7G9xQozNZBuVoNZqgWQUpnPhekVOn2gMM4r2If7ZJRYlhCgNNkHXu7WskP+EQxttA
         fidSI0LCPUiVhWmscZK7Vft6J8R+//VcXYj7h22GPpS4a241oAb2djmFVUZCx3bQpUye
         0/GpWArHRgbxKRzhoUrqbeGMBMWZoaQUdO96Ljzh5++b82GPbt+koz7TByJBc6keXRmr
         rXe7jlAFjFPhVhm6srZS2DCz2qVaO7yUorwexiGyUdpz3dmHrLSrIAFLo84ZuuQn+z0g
         RQz+ZODDyox2dcM1J0FLp51Hv/+nmpbYrT9BfUbppWWJMRqLVWgukAIULba7pxG8RY2M
         tywA==
X-Gm-Message-State: AOJu0YzoTlQPNQEOOr3e5OX79PzEbd/B3rvSmTq6nsD52m6OH5rY9AcP
	dGFarxXgjUKOnllCUiglxkGOxPUXTB8cDQsrOZnKuVph
X-Google-Smtp-Source: AGHT+IFfwY3tjnli90juA87rXqX8MC0uM9l18PNKEs4DV5pztjizgJT25Ua5Cntj35LJhfliQCspjZIL4qWRk6tgfH8=
X-Received: by 2002:a2e:a78e:0:b0:2cc:d3ed:e315 with SMTP id
 c14-20020a2ea78e000000b002ccd3ede315mr3639480ljf.22.1703919422601; Fri, 29
 Dec 2023 22:57:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231230022136.GA19799@rigel> <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel> <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
 <20231230055330.GA47174@rigel> <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>
 <20231230062933.GA52702@rigel> <CAJ8C1XN71bsBkXgjdq0=2SZuJqs2tONitz0vv_OPzp4na6LofA@mail.gmail.com>
 <20231230064345.GA54180@rigel> <CAJ8C1XODp8FKbEOqreAUQwKdXw=QgFQxF=KYXEC_zpeCSALa1A@mail.gmail.com>
 <20231230065126.GA55355@rigel>
In-Reply-To: <20231230065126.GA55355@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sat, 30 Dec 2023 00:56:26 -0600
Message-ID: <CAJ8C1XNQiKSbyUassc6Vq0nxFzBdztH29SQE2-0vZCzVBSpbYA@mail.gmail.com>
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 12:51=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:

>
> Do keep up - I've already done that.
>

Well I'll be damned... I don't know what happened, but YOU WERE RIGHT
AND I WAS WRONG.

Enjoy it man - you've earned it :)

