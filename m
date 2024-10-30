Return-Path: <linux-gpio+bounces-12323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8C9B6F7D
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 22:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C63C1F21AC8
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 21:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AFD2144A7;
	Wed, 30 Oct 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chaudron-nautique.fr header.i=@chaudron-nautique.fr header.b="SU4kj9w7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net [46.105.63.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269001CEE89
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.63.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730324363; cv=none; b=qJg5/amrBMcplUlb4nqbs6/vK3aKcUVQQvGDK/ln1uwFZth5KEQBvkLg5G72SAxuDlHE2SCxL+zKeOLG4ceyWRCb1gxJMd5CqqFXvs1bAwk1b5uU6JRTov9x4/+114+CgMUd1WOS2tPn5tU+VMo7CJk+6hZeRHubc64/Cgr7u8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730324363; c=relaxed/simple;
	bh=MLkgZWuUa5ldTl2dW4/+4yInyl6iU2xE+/B8Rrxc9jU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=oGkeM/xJ0OxBWJBZ9CKD3TnL2OsOMZEIEh8j/etpj1zMLRSFDLgbWwwwSiacN0YWTKjmJbHeeMUIoXpamlGYPtDg6K/iy50H6WanhIis7g2oy7r0UVSxkZ0SKBn5t+7ztFCidBAFEBCXpoe4WV62GiYRkWwXize9pllc6J7XyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudron-nautique.fr; spf=pass smtp.mailfrom=chaudron-nautique.fr; dkim=pass (2048-bit key) header.d=chaudron-nautique.fr header.i=@chaudron-nautique.fr header.b=SU4kj9w7; arc=none smtp.client-ip=46.105.63.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudron-nautique.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaudron-nautique.fr
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.17.234])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Xdzyv5dr6z1WSr
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 20:59:51 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-4n9gt (unknown [10.110.118.160])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9BD261FE08
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 20:59:51 +0000 (UTC)
Received: from chaudron-nautique.fr ([37.59.142.102])
	by ghost-submission-5b5ff79f4f-4n9gt with ESMTPSA
	id J2GXHkeeImfNMAAAgWZk7A
	(envelope-from <vanvan@chaudron-nautique.fr>)
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 20:59:51 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R0046677c051-aed4-4da3-85c8-fe84506e1e68,
                    770F74D5E79245AB0A6C75712EC1B03E302C65DA) smtp.auth=vanvan@chaudron-nautique.fr
X-OVh-ClientIp:82.64.108.188
Message-ID: <35d12c34-848d-4093-a0f2-30fb57b1299b@chaudron-nautique.fr>
Date: Wed, 30 Oct 2024 21:59:05 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Le Chaudron Nautique <vanvan@chaudron-nautique.fr>
Subject: libgpiod 2.2 installation on RaspberryPi 4
Content-Language: en-US
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11405084584021117865
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgudegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfhffuvfgtgfesthekredttddvjeenucfhrhhomhepnfgvucevhhgruhgurhhonhcupfgruhhtihhquhgvuceovhgrnhhvrghnsegthhgruhgurhhonhdqnhgruhhtihhquhgvrdhfrheqnecuggftrfgrthhtvghrnhepgfegfeduveelieevieegteegiefhheevffeuvddtfeeitedtuedtleehleetvefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkedvrdeigedruddtkedrudekkedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepvhgrnhhvrghnsegthhgruhgurhhonhdqnhgruhhtihhquhgvrdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=JGxH+4+kEwTOLTZv54AZw46zh3vGNT6tc2U6rBLkE8c=;
 c=relaxed/relaxed; d=chaudron-nautique.fr; h=From;
 s=ovhmo4169961-selector1; t=1730321991; v=1;
 b=SU4kj9w7r7zyOCp2i4vornKHTSV+a+BpKENm2lYyJQOZANx15XmCKVCiffo11u8PEka2uo2/
 IV1rSDuchbtRBAwOCVXwV11KUAxsdDXm8okmyt3DtTPH1nULfRlffUuTG9pwy1pl6BSqo6JH7/L
 nNLPY1DXj7dtZXLtxdyY6e6DWky9ni6lAHK1DckEfMvu8xozYoQ7YDFPnK2Hrf4VrUOmBF06v6x
 sNSH7G0rzeeTAsUFi/vuim0UCDB3Gm2l4Sjy0DOfel0u+EoIkUdrKOYgKMC7nv6SposZf4VCIy1
 woV147p7qvb80eH9sTkUM+/qQFUe1YzjsA0Yi89BeYT/Q==

Hello,

I have some trouble installing the release 2.2 of libgpiod (or rather in 
linking it).

I want to use it on a RaspberryPi 4 (kernel 6.6.56-RT and 6.12-RT) which 
are not provided by Raspberry but taken from https://git.kernel.org, 
thus the problem might come from there.

I have taken the 2.2 tarball on 
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/

when I compile my file it seems ok (just trying with one of the examples 
from git : chip-info.c), but when I run the program obtained I have this 
error :


./prog: error while loading shared libraries: libgpiod.so.3: cannot open 
shared object file: No such file or directory


The path for ./autogen was /usr/local

gpiod.h  is in /usr/local/include

libgpiod.so.3  is in /usr/local/lib

My programs are in ~/prog/userspace and the makefile uses -lgpiod.

Am I missing and option or a path to be declared somewhere ?

Thanks,

Mathieu

-- 

