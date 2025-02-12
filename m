Return-Path: <linux-gpio+bounces-15860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF25A3282A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92BAA164CDA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3493F20F094;
	Wed, 12 Feb 2025 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bRzgpUYc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BE204F84;
	Wed, 12 Feb 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739369731; cv=none; b=nglsausJd8klSPbL96jgGN654mtV9raEFbv1tBiQTFNbttYTpIYcLj3J+eho3yk8K7TiTicUtic/XTERxfIm/1N2eLGHP44Os7w+6smbG8yHEbccezp2vrKv+I8u+tcq7TreaEA8ylPb9rv1kGI4vaGE3GcAFdsAQjouzXtFq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739369731; c=relaxed/simple;
	bh=iCWXvj2a4k/niiC9u9wcJPbUXpQIPybramZFQ8uqJqU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FWrIfkks34b8/BKiw9jlq/YTXaMp3+e5fbycmq2M0zThXEzJ2kQWg1vkUtlyq/tfvuHmtubQijrElhTW/p4pLqPX6nA6DSAvYCPw8q/eeDjxypd+jOvAh/1H0Ebr2h1MKJnU+YuGJQ6xikWp5MtdIa5aak8ncnuiDOBIC7MDVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bRzgpUYc; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739369726; x=1739974526; i=markus.elfring@web.de;
	bh=iCWXvj2a4k/niiC9u9wcJPbUXpQIPybramZFQ8uqJqU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bRzgpUYc5bFwukP1xFjqV0U09qF7mRfihWuRv8064J8GAYSEQ2Zmp0wEQuaWEeV7
	 Sw4E/3Ix1A25Son42E1gomKlyLbm8a+DAMKVYY0eq59z66ilOAWCYTx9EeA03CYfB
	 SOyG5e8S6ORZqHAYgIfh/M6Em+mE7fm5sCkUqlYSUjXR9Kb+sq3bLDZvH3eeujNtj
	 pzp6Dq+/MKCd2iu5vIEdiZP87c/HrgvFbzrjTxBOq+GvM/pgcrysdV0fp/DuW+xaN
	 lLRAUsRRsCGssQRu+jIp4b5BtatZtF+0hWa/sy548/IM+Whmab8O39ENBdrGaaxLH
	 5PqwCIBh48bSCG0UZg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mo6Jz-1t35GP2LAB-00enKW; Wed, 12
 Feb 2025 15:15:26 +0100
Message-ID: <f06c4e1a-54ed-4f3a-9a7c-dfda31cfb74e@web.de>
Date: Wed, 12 Feb 2025 15:15:25 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250212021849.275-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] gpio: stmpe: Check return value of stmpe_reg_read in
 stmpe_gpio_irq_sync_unlock
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250212021849.275-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eVHoFBcXsVWoExu1oCJST499N7xA6sGYUk+9smIyUo+VAhMgItd
 XapbKlBkL+idgPAEziKIMcQ+8DPn0nPg8v8u8HUAZa5CwwxzztVuDFjX730Wlv25BXy/QZs
 XcfTz8/DiugUW02sEV2u4jEfFdvcmyQxPwPPg3iDO6azH4nXuQRLTf80D8GlqN4N3jT7eSK
 940M7jkccaQY2RwYRnYWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3QrbsvZSHUs=;9l/kj/POfuaGbCezmxBAoK93rii
 jYtCIMX0iUkSIHCp3wZx/vllbrrhYjZhjP7jtcd06TV6IBjCFzJ2n0GRvor2AqgFRpVzVLW7w
 djxycQ9Y/m8byXzLiAPi6IldW31sp5hJ62aTvKAlWdeLFwWEn4zziy8ADZ8TO++0AP1LOLuyG
 kSqejiANytqM2nsaW0ywFivqY0aBj9QpfN0dChMWxqPd2rNd90VEROIOHTkmCxz3Kc3j7dWOk
 jMA4T1w/qQqg9IZXWyz4xBODYrQrHRdkIB3iKpLa8PxZutP84uGrJ0Fsa3qwDYiwXYcxCWCk2
 JC8W7Q1zx8xVEk2lnMT7x8SQ/tL1j/7KlRMn83+TTgt04zhAbRgJkHFaBd81QeP5uotFcWz3v
 HV8caupclOrsT8aJZ/T/m5f/RG/ifibC46o5TdtsqIToZuH+KB0pBPsagkv4sIJr4iq8VjHhq
 K8XyF3LdiPtMaFIoG7o7kaQUr0pHNIj89V4U82FNIaKbGoTEJlZHPTn4RGDpgSvQ/TavbYmfc
 76TflS/87bPL/gcp5dmWIBx70DrsoPKHvmPxP6QJjY6LR4Yn874e4raANl1wJzndWf/eoM7sx
 WY1Hhq5uyTWUFrbUKvvVgNs2RBghpbSOFOFTNVvJXdyl1KNzyExQ+X573lI/NCXBGraaCheho
 4ffL5b60QbxKvjWhgdevlKPWSArRLmaAHRsTXojKO4xdQohoAtsw2JzZRq1W1sdY2o9dMEAjv
 xfT/eAZV0lrrRBHg9VwCODH58GCdjjdsHFtEu1w9c2sZD6JZzBgrjuJauWn+9dfMGsipu9Hpv
 6IaQbP12EGVKR5h6drO4SRQM43CQERsC5Vtrp7FMEYmQEvqJsvAQM9D3Kg2AIo5xko6DxPrvP
 4fF7OIWBwq51dSkHWEQ2PW5mJIpWr6zkQ2oWYJZ6osiZT6T860wgqI29IrDL4JB76jTbkGCW6
 vVnvK4gsrIpWpmeEeAxO5CMHF/B15da6K+VWaAfoEH4GOgzQVN5C2lVi8rGXjwH2lHbZqVJ+4
 e3OC8XFuYqCnjGeTbeyoycgq81HOBfMHdlJGJo3mhP0ZP8CEND3c/aDK5mUGsSICK+90pLRro
 eRiNuhI8XDqa6jtWknBEF/tOD2hyfpvAoVJguVCPAUc90iKKVloCAv3D/Q1FXIVIEzRdE6+JL
 A6oUvisQWnUxaob5hLv6CImeKK1UW2t6BkKwUwuwvjiqwEyhpFN872UrJLJPS9g3N9vfjGunY
 D4hM0h+vZxLsLzORuDmEg03bNcJZSZKXJuS3532GnYb9ZIQ/Mbbh3fmrcEUzowd2NYAFaq8Cb
 3/0M0g2GlKXr+d0InI+h7/C58y5tJxLHFHHk7t+mnE710q4mlqlayBFuWbGhU8bRUU2F5JyQu
 2gPuPb03lpP6Lb9zIw/3hRb6rhiFyV/ImPeF7EsXejW52RxyGqSgv2zFKCGmciFFIrcTxY0lx
 AgWX0lA==

=E2=80=A6
> This patch adds checks for the return value of =E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n94


Would you like to append parentheses to any function names?

Regards,
Markus

