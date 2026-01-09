Return-Path: <linux-gpio+bounces-30379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B19CD0C8A3
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 00:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA886303BABC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 23:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFFA33A9CF;
	Fri,  9 Jan 2026 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS5HVhuf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5EA33A01B
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768001136; cv=none; b=Jy/lSRxG9HlMidLUyECHDH5M0BI4oaf+lLEHALcahHBIOZkZsXFen/EYo7LclD0UIthTmNzit3/gJVJtnYMuETM0ENpIc49Du+plzPkusGjcruS/hi9bKSYTrWWCUezJmqdgT5yqdRF5sAF0CTyBDw0Cu6OKTAMUpNI8aWv8lnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768001136; c=relaxed/simple;
	bh=E6sN53i8IcYPHCMyzCsyhF9l2xXsRX9po5WRw/XTnyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGAwNO5uOLI6WzSwYvVjNa4A9d9h7C007Kd4IkVsZmoPAQvZbWuBXsc2qG4L9reDAJztuzADxs+tr5+pO0Id/99vRjlFfWEDgHfLNFC5NFRvHNOzdVx2Am6uoH2p8kk5nYmWxRWUNzUcv6+xZphkuhhVxPx2ft+ZHHqyxEWcfzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS5HVhuf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A1DC4CEF1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768001136;
	bh=E6sN53i8IcYPHCMyzCsyhF9l2xXsRX9po5WRw/XTnyI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YS5HVhufDULIEMJAqSMxPTiRANcar8bBwV0qDL68VhiVSZ4dcAlA6DTDf+dv4coIp
	 NUvqo6HPzXAoRdF3EEQp2eP9ZyCMFL5DeubLRDSmghP8zWknQgeFkuBe/OYlUXUro9
	 5irQaOuoFC/9edKYdfy8M0eTCRMLIMlfXIMBJCV2deRtMjbTMWoz6DFMgHXASbNU14
	 RcRurxHXWvQUEqDJmgiMj0QkZjf1JIr479ITutUBxgFnoubIuYe2J0TncpcTlx8gLb
	 hROrydWDi48XNAh3ZR5ulfQvu4auVgxgvsy9l4eAZcT9L/mZtYvoBWcFAF6Inl+DxZ
	 WbsEvQrudzLXw==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6446d7a8eadso4269973d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 15:25:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdW1XaCdXUVAOe5Zx+7sqMujq8i7Ry6AG8na7TP7PX+M+avUP7kekDgwkCNlAxw1orZXMUKCd47mJT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88cAUBM3LOVmLcj8ohkAwmCJ+AZRldRse6rSSlU9BqfexfBmT
	LjLdRlBf2Ud+Wd9e6W/qNxhNZy9asBkNIXYC2Uzi/7b7Z8an7uV56+vG1PdQOpRBh0KdW2D2j70
	VUgNRKm2S9zCYyrfZE71xoINyfOFkfUc=
X-Google-Smtp-Source: AGHT+IEaoeL2t8NUGmTZD0XKUOjoQjQ1H3SHYVfKt2NHn+ssSjozzn7k7WXsNEpyI7cQj0MU6eQn8CTFIEabkdw2muQ=
X-Received: by 2002:a05:690e:2505:20b0:644:5d3f:844b with SMTP id
 956f58d0204a3-64716c386d6mr7983337d50.54.1768001135395; Fri, 09 Jan 2026
 15:25:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com> <20260109-mips-pic32-header-move-v1-7-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-7-99859c55783d@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:25:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkg7tkvK-8AN_-Lc4nh2MdJ_i5pYu8VRiOj2tkMja0PCQ@mail.gmail.com>
X-Gm-Features: AZwV_Qgqr7QAFzptSbHsdydihnr5_kpsEo3wxvqCEndt-CO4yYuLaStJBkvSuc4
Message-ID: <CAD++jLkg7tkvK-8AN_-Lc4nh2MdJ_i5pYu8VRiOj2tkMja0PCQ@mail.gmail.com>
Subject: Re: [PATCH 07/13] pinctrl: pic32: update include to use pic32.h from platform_data
To: Brian Masney <bmasney@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:42=E2=80=AFPM Brian Masney <bmasney@redhat.com> wr=
ote:

> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Fair enough, if the whole series is OK:

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

