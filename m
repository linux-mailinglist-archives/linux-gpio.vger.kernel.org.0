Return-Path: <linux-gpio+bounces-3166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA48503C9
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 11:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610B81F23692
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 10:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB6836135;
	Sat, 10 Feb 2024 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Xk65+K2D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092153FF4
	for <linux-gpio@vger.kernel.org>; Sat, 10 Feb 2024 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707559621; cv=none; b=pgtx8Xiqnb7nfzSWmRc0txDEsQjf/5dPIWoRvkky2DxVpVTUDjHHyPNFKt4fvrH4m6Qgv9Esw+f9VhSzuhqEGSWgdzVMreY0JkeqUwz/ECMVZHOmTAyjdTvG+uhEoe+2xkXVj4FAHs8Fu9CxONhRbaTkrIMELbcMDSsCSIhB8rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707559621; c=relaxed/simple;
	bh=crtZxkCUIbnGYVLCTPgxa9O71DG3YyFCN3vqxXZ29uo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=psLQP+ja963Pg2ocw1JnMVJwmF7djyMVGUFDYtITeu5Ah6Ae/tKxdToGX/6qkfmsNjepBgLKNLK/Hek1zWl1LJ1uInuYnHh2w/P68pFez8NnAWfJ332c3E6oaTmHG4xZRn7phc5ovPNNlT2rm2iLarQUP/Sd6y65URmGTLWGVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Xk65+K2D; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1707559615; x=1708164415; i=wahrenst@gmx.net;
	bh=crtZxkCUIbnGYVLCTPgxa9O71DG3YyFCN3vqxXZ29uo=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=Xk65+K2Dqv0AwTgGpbnxDsdiRY/zQdXSbtIWBOmbifAo0HUuudW2XupfUJ1sLK15
	 t/qcwce3mk4Nfc79fpm62YEgjTy8tVAPIQ3oSNR029c+KVRSPeCR2QZfVQdzgXxIU
	 4MLtuqQZKSagI9t8+DO6oMNdVzefaWWuyEqUWCxk5RTwK22ALFLFfpASGRcK24KsT
	 dHidZ1FMkggaDZZlocq80kV+mS1jtzQ7bwuCXdYoy0Vc9Kr/ZlX/O2vprmFJx0we+
	 5X8CUm1620IYAhibYKUOc/zrJvF2eAV/UuESlSM/WNAcdMVAu/9i1aFtTFEWyTZpe
	 7z3PXBvUaRe1JkZ0pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhlf-1rfeno0scR-00Aqz1; Sat, 10
 Feb 2024 11:06:55 +0100
Message-ID: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net>
Date: Sat, 10 Feb 2024 11:06:54 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: WARNING: fs/proc/generic.c:173 __xlate_proc_name
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JPIDcYO1gUQb7RgVc2YiWGh9dTtUw/v8wCOy9zj3r7tVjgRMksM
 7t1WwNKyiDurhxg7PL0dRNCUbAziuBvEpdxaU9MKeBHovMedLqU/rb/iz8oj26jjdwyVGTU
 q9ec59XGZ4TX88QhKF3sDUaHQgLIfkF7yNunQosDClOhefL58n0nsK6rllvr54qFjMyI3aZ
 MnnhtBpdFeoD1Yu3Eqy1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dH+I2A677OQ=;18zKmr9Ww1toAcC7dW73EWkSeK9
 L7gYnTbxDTEVzHDBe6RAMIf0BajKyVwwl3Jo9fC0Usob4IyhebUo2gOr1FO2S7Ifva+c+FASS
 yUSDMKKgv8uSGxFar4NDFx8w0cFT0Aois9Z8/+LE3qU7IrnOTFBfBS6L0vCiHsXGGp11CQurE
 vsndSN+YxI8IRk3Ux1I6orf8cujFIx2FbHImSJpxcJXG51ibFyvDacmRlRfe7zTp5J/KN9wcZ
 y5hXXT/RdWxy4CRnRERAozORHPYQUpySSLVPCEJ1J888HtQ3L24wCqo+Jq72cNWs83bAgVX1Y
 xegk40P967+FgQVLx92nxonhwPPbDccQnVvQtBAtleNonXLmOyjlNFsWbzDixHVGyDJsSBBtV
 1VS0uh9xo3agoaO9tMSdbBSB62XpfXHHb+x1cIj5YQO6aly3945hyUmT0LmrRtSH6LT7VKJjG
 MhpAnJ70w98q6xCBZdNBybOP7H+uiXIJZN6Tg1W/kE+buPEmGTedlSRktAVQhFr+ZyXPCn0qj
 +Du8aQHJOtaF/v81T1wUw9N6Dp1EerJpe0iN03lqdx7GqKauSl2Q+yAAaPrqRvNbX/4SP6YCe
 X2lLGA85OKP1Qrb3ne/n7e2PKlV52nyXMrMC6smf5DS1xalaP4RIR0kFV9uriQl950VVbSy92
 32EE/t+02+2wvgRxA76PRuAKxmZXdiHZtgL69cfcCRg1v26pfAhS47TCm5SNykUnOhXqJ2npS
 3SFP+u8W69Zc5owrRaFPY4t9qmTbt8rKbjNHKpIwHTuAvmEJFW+L5QMSkO5AAekDsQrt6gkul
 gRWrlIkhXzFBHvTJuHmjEHvzlE5WZ392p3KSEYDZeV0Js=

Hi,
we are using libgpiod-2.0.1 with Linux 6.1.49 on our Tarragon hardware
platform. Recently we implemented an application which waits for GPIO
interrupts and we were able to trigger a warning by naming the owner of
the GPIO as "R1/S1":

WARNING: CPU: 0 PID: 429 at fs/proc/generic.c:173
__xlate_proc_name+0x78/0x98 name 'R1/S1'
CPU: 0 PID: 429 Comm: cb_tarragon_dri Not tainted
6.1.49-00019-g9dbc76303a17 #147
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
unwind_backtrace from show_stack+0x10/0x14
show_stack from dump_stack_lvl+0x24/0x2c
dump_stack_lvl from __warn+0x74/0xbc
__warn from warn_slowpath_fmt+0xc8/0x120
warn_slowpath_fmt from __xlate_proc_name+0x78/0x98
__xlate_proc_name from __proc_create+0x3c/0x284
__proc_create from _proc_mkdir+0x2c/0x70
_proc_mkdir from proc_mkdir_data+0x10/0x18
proc_mkdir_data from register_handler_proc+0xc8/0x118
register_handler_proc from __setup_irq+0x554/0x664
__setup_irq from request_threaded_irq+0xac/0x13c
request_threaded_irq from edge_detector_setup+0xc0/0x1f8
edge_detector_setup from linereq_create+0x30c/0x384
linereq_create from vfs_ioctl+0x20/0x38
vfs_ioctl from sys_ioctl+0xbc/0x8b0
sys_ioctl from ret_fast_syscall+0x0/0x54
Exception stack(0xe0b61fa8 to 0xe0b61ff0)
1fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 01b019b8 01a9f428 0000000d c250b40=
7 beeae888
beeae880
1fc0: 01b019b8 01a9f428 01af7e40 00000036 beeaeb88 beeaeb80 beeaeb58
beeaeb60
1fe0: 00000036 beeae868 b6a88569 b6a01ae6
=2D--[ end trace 0000000000000000 ]---

I'm not sure where this should be fixed.


