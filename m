Return-Path: <linux-gpio+bounces-12410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B69B873E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 00:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E849D1F22543
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 23:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAB41B533F;
	Thu, 31 Oct 2024 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chaudron-nautique.fr header.i=@chaudron-nautique.fr header.b="Vojb3zvm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 1.mo583.mail-out.ovh.net (1.mo583.mail-out.ovh.net [188.165.57.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B113A868
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 23:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.57.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730418354; cv=none; b=rKuto1r9nlFi1Swfoe6zATG/8Sv+S2DFDMKxuRkFRT3NNmpZzpIE2RNXWuAP0KH9tiZcNOPnbtUOBXRxNWMj7X2B34DLLaRVASr4/VfQfMjOKt5zalsstV68Lw+6qG/X+L/iTsP6mprTySABiqQiwLOlTl4ODmogJDuET5u/iRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730418354; c=relaxed/simple;
	bh=gZ7qJLS2P+imqOYkeEZQgdg9pFIf6UoUUqz/865Aa0Y=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2+Aycr+SNF5xS7QuN8WKgM1rzYV8nNHbIClZKah2EOLdO9yI1OugALo9wTrjPcxEM3k3BcYopIaKaNIk5uu/s7Sj7dn14oA5ZAeOBugUB7DROxPsapXFnkiOZ6sVGiG0vO2zLkhKHrM5CUcu5x58XPUNRRSz5iFv8d8dj3Km/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudron-nautique.fr; spf=pass smtp.mailfrom=chaudron-nautique.fr; dkim=pass (2048-bit key) header.d=chaudron-nautique.fr header.i=@chaudron-nautique.fr header.b=Vojb3zvm; arc=none smtp.client-ip=188.165.57.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudron-nautique.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaudron-nautique.fr
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.176.103])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4XfR176Y4kz1Xbn
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 14:18:19 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-qjhvw (unknown [10.110.168.229])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A0A8A1FE6A
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 14:18:19 +0000 (UTC)
Received: from chaudron-nautique.fr ([37.59.142.102])
	by ghost-submission-5b5ff79f4f-qjhvw with ESMTPSA
	id 99iDGKuRI2dI8QAAZsWFxg
	(envelope-from <vanvan@chaudron-nautique.fr>)
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 14:18:19 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R004f4c61331-a21f-48ec-8445-433da9f4be0b,
                    707BED5FAB86DDFECF66313A6B4F0D3656AAE066) smtp.auth=vanvan@chaudron-nautique.fr
X-OVh-ClientIp:82.64.108.188
Message-ID: <3404b96e-f858-48b4-abfc-0a836d00e730@chaudron-nautique.fr>
Date: Thu, 31 Oct 2024 15:17:32 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libgpiod 2.2 installation on RaspberryPi 4
Cc: linux-gpio@vger.kernel.org
References: <35d12c34-848d-4093-a0f2-30fb57b1299b@chaudron-nautique.fr>
 <20241031020858.GA35451@rigel>
Content-Language: en-US
From: Le Chaudron Nautique <vanvan@chaudron-nautique.fr>
In-Reply-To: <20241031020858.GA35451@rigel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10496483358838934441
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 30
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekiedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnecujfgurhepkfffgggfufevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfgvucevhhgruhgurhhonhcupfgruhhtihhquhgvuceovhgrnhhvrghnsegthhgruhgurhhonhdqnhgruhhtihhquhgvrdhfrheqnecuggftrfgrthhtvghrnhepjeefgfeukeehvddutdehvdekfefhvddtvdeuvedtgeelteefvedvgfehtdelvdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkedvrdeigedruddtkedrudekkedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepvhgrnhhvrghnsegthhgruhgurhhonhdqnhgruhhtihhquhgvrdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=SEuSnBLEXahluv5iQyZL8sYyWIafefNWAXQw1ZL4weI=;
 c=relaxed/relaxed; d=chaudron-nautique.fr; h=From;
 s=ovhmo4169961-selector1; t=1730384300; v=1;
 b=Vojb3zvm6we3m61vxaclXs5Ix+XbYo6WoOr8nZ8ZocUb3pYkDCjZK5MSjfT9vdDwBG9u3ZCS
 OmzGx8rdWC3Ai9Nkv1f49vAY/f5APTzjyOrBsv43t3lBDmEMYnm6wEilBfU6C8ywiYkH3fEbboy
 kZgGtNlNluqvJ4foG2bC4AC86JHubxOrM2266Tpbw3+ndp6IjeWHDvI6RuscFJ3VcO2IueDWLVr
 omsA6o/WfUaS8bMKQASFnSAACCdIes8N/8CBXON6ZnoC0hxBFwLrF3sOgXuAwapTGeukTLusA0J
 CiqRj085/ECv6RlVoDz3OqCJj1BIqUWbuEFwBkg4wtnkw==


Le 31/10/2024 à 03:08, Kent Gibson a écrit :
> On Wed, Oct 30, 2024 at 09:59:05PM +0100, Le Chaudron Nautique wrote:
>> Hello,
>>
>> I have some trouble installing the release 2.2 of libgpiod (or rather in
>> linking it).
>>
> You mean "linking to it at runtime".
Right.
>
>> I want to use it on a RaspberryPi 4 (kernel 6.6.56-RT and 6.12-RT) which are
>> not provided by Raspberry but taken from https://git.kernel.org, thus the
>> problem might come from there.
>>
> No, as you can link a binary, your problem seems to be with your ld path or
> library installation.
> The default path should include /usr/local/lib, so that probably isn;t
> the issue.
> On my Pi4, the relevant config file for that is:
>
> pi@pi4:~/libgpiod $ cat /etc/ld.so.conf.d/libc.conf
> # libc default configuration
> /usr/local/lib
Ok on my side.
>
>> I have taken the 2.2 tarball on
>> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
>>
>> when I compile my file it seems ok (just trying with one of the examples
>> from git : chip-info.c), but when I run the program obtained I have this
>> error :
>>
> I assume you mean get_chip_info.c.
You're right, I spent to much time running through the different files...
>> ./prog: error while loading shared libraries: libgpiod.so.3: cannot open
>> shared object file: No such file or directory
>>
>>
>> The path for ./autogen was /usr/local
>>
>> gpiod.h  is in /usr/local/include
>>
> Not relevant at runtime.
>
>> libgpiod.so.3  is in /usr/local/lib
>>
> And is it usually a symlink to the actual library.
> What does "ls -l /usr/local/lib" show?
The same as yours (except for the exact sizes).
>> My programs are in ~/prog/userspace and the makefile uses -lgpiod.
>>
> Shouldn't matter.  Try using ldd on your binary to see what libraries it
> is linked against.
>
>> Am I missing and option or a path to be declared somewhere ?
>>
> It is difficult to determine the root cause of your problem without more
> detail.
>
> Here is what I get using that tarball and:
>
> ./autogen.sh --prefix=/usr/local --enable-examples
> make
> sudo make install
>
> pi@pi4:~/libgpiod-2.2 $ ls -l /usr/local/lib
> total 372
> -rw-r--r-- 1 root root 239480 Oct 31 09:40 libgpiod.a
> -rwxr-xr-x 1 root root    946 Oct 31 09:40 libgpiod.la
> lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so -> libgpiod.so.3.1.1
> lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so.3 -> libgpiod.so.3.1.1
> -rwxr-xr-x 1 root root 155480 Oct 31 09:40 libgpiod.so.3.1.1
> drwxr-xr-x 2 root root   4096 Oct 31 09:40 pkgconfig
> drwxr-xr-x 4 root root   4096 Jan 13  2024 python3.11
>
> pi@pi4:~/libgpiod-2.2 $ ldd examples/.libs/get_chip_info
> 	linux-vdso.so.1 (0x0000007f9e276000)
> 	libgpiod.so.3 => /usr/local/lib/libgpiod.so.3 (0x0000007f9e1e0000)
> 	libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007f9e030000)
> 	/lib/ld-linux-aarch64.so.1 (0x0000007f9e239000)
>
> pi@pi4:~/libgpiod-2.2 $ examples/get_chip_info
> gpiochip0 [pinctrl-bcm2711] (58 lines)
>
> What do you get?
I didn't add the --enable-examples, I took the code from git and put it 
in my test file/directory.

vanvan@lcntest-stable:~/prog/userspace $ ldd prog
     linux-vdso.so.1 (0x0000007fa851e000)
     libgpiod.so.3 => not found
     libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007fa8300000)
     /lib/ld-linux-aarch64.so.1 (0x0000007fa84e1000)

Should I look at/capture the autogen logs to see if something is amiss ?

Thanks,

Mathieu
>
> Cheers,
> Kent.
-- 


