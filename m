Return-Path: <linux-gpio+bounces-7570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C37C690F9D6
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 01:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21E9D282D9C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 23:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B6E8248E;
	Wed, 19 Jun 2024 23:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="dohAyRhp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98B1E515;
	Wed, 19 Jun 2024 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718840758; cv=none; b=G7B54nB0nEnQO//XyAytjEUZ4Ftapqe0zsNtGU/kXc+697/BNKyTLvtgXjOpAUhhzEW3GCKu1tnT5+hQ6ZqyadF248JQ5Mz0Us3G6csrEFz0NwHDmg7gu2D4idLwHkABg73pb8vNVtY8+Kg0j4bNXP97e2KZxtYXOTJC+kLpLGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718840758; c=relaxed/simple;
	bh=0rrDHG6GQ3ZPTEMZclkJ055uBnnGraoUKkuWTroE0M4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hdYRsqurgKUtJ/ofPeWNQs/WwhY6ps6hYrBCQlJUIORK0AnCX/wPBgCBXrb0NQ+YakrOs7kDzqE/0JPNVX4kPE2O6Z2p76zn5fL6ZqRwNiwrgnvzUWqtLrO6RUcwdq7rIXKJKffNSe5AXmIm4yzkLrTxqVCkygawy8/zERD7Vts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=dohAyRhp; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E2FFC20154;
	Thu, 20 Jun 2024 07:45:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718840753;
	bh=0rrDHG6GQ3ZPTEMZclkJ055uBnnGraoUKkuWTroE0M4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dohAyRhpTxw/33WRPJ9Mdqdis4t5zfM7m2r0c1IETWbFfzW8o2bc/bsGafowhlV+P
	 m/WrOnFyU3V75fhr0Qx8HqVZ6QE+fosWnPRsiumeCwa++ucEUuXhZsHtgRQm3I+25n
	 ip8KqrtQD0qK1ZmJqi1OXHP2lLhvM0Z7z4Dkxr1JWYWrbO5XY721k5aLSkc7e8wwsM
	 uNlh4h54Uq00W49U6koh5DWhhaidC7eT1saqTfxy8+lX1j1agu7jl55Arxt1QaC6GP
	 SnujxMbHVrqYL6GepkQZvk2+7yhur9jCzW3W5AzVDLJxJwKHbNep5WmKl1apYVHMEF
	 ImCCkpwzBusCA==
Message-ID: <4eb1830db13cc3aa8d23d2c6075f744c0b75bda1.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
  linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Cosmo
 Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Date: Thu, 20 Jun 2024 09:15:48 +0930
In-Reply-To: <CAGfYmwVJvyEJ6sbvr=_OqNkiRSDBXn2uqMr28gN949NZd=5dcA@mail.gmail.com>
References: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
	 <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
	 <CAGfYmwVJvyEJ6sbvr=_OqNkiRSDBXn2uqMr28gN949NZd=5dcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-06-19 at 19:24 +0800, Potin Lai wrote:
> On Mon, Jun 17, 2024 at 3:33=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Thu, 2024-06-13 at 16:07 +0800, Potin Lai wrote:
> > > In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is=
 not
> > > needed on the management controller side.
> > >=20
> > > To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRC=
LKO,
> > > reducing the number of required pins.
> >=20
> > Hmm, I'm not convinced this is specific to NCSI (and it's an
> > unfortunate mistake on my part), but we do need to call the groups
> > something different than RMII[34]. Did you have any other suggestions?
> >=20
> I don't have better name for now.
> In ast2600 data sheet, it also mentioned "RMII" & "NCSI" together most
> of the time, is it ok to use "NCSI" as a new group name?

Perhaps we go with "NCSI", because the other thoughts I had are all
much less succinct.

Can you please add a note to the description in the binding that
discusses the difference between the RMII and NCSI groups?

Andrew


