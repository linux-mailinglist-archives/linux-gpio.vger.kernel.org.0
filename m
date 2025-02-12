Return-Path: <linux-gpio+bounces-15845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63152A32621
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D59E7A3169
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 12:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818BA20D4E8;
	Wed, 12 Feb 2025 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PJjHheBp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B572046BE;
	Wed, 12 Feb 2025 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364330; cv=none; b=omiyqU4ZVyiB610Qe6zH+LLCSnivOw+W+YBsrJW0gIas7gaXt+6ysFQg8ZKb80acvn4g+bdkPamCtpTdi42TvEcSWOUjyr6bHo+tE2vjX2rJYqlGnkdNmrrIn8jlPFynkm9P6QE9IE6F+Jc9nvx2693TINqmZ9oGszenZ7CBXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364330; c=relaxed/simple;
	bh=4JRn5iL42MJEpQHlbzIijk4WcEtoHNrpGhgeTaJH47M=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=r2/JbVqMSDLPLHyGSqV9jXDstHlAd64rocxTlC0NLJOZQXFF1CB5oyy35kJDLg/eh+m88OtI8WMwdjU73+Qf0e4m8dj6FiW2LvvMbbSygEk47DGYhx+Zda7JRRyus9bRnY6MjcbbrpHhzvaJgKr+j8EGtrwt0xLV26ys04OcQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PJjHheBp; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739364319; x=1739969119; i=markus.elfring@web.de;
	bh=4JRn5iL42MJEpQHlbzIijk4WcEtoHNrpGhgeTaJH47M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PJjHheBpgdSXsx+Umol8T4yAdHWvj+q6JEM1R+fHcAJj4aShKG2t7Fbc7E8cHDVU
	 U9AqmWFUcHLiRk9Cy3Vq9gNuajj1WxIbXcUhJwQUuLqpVEorfg06OS2NV+TSvlHdU
	 pfb2kdngqIh0l6u3BCSNviBVtM1Q6dIG2coiN3FFz5dSxCSvzWmomdA31f/ldG50Z
	 EAucS96Ngx7tWglfg8YWhsLnk9OhovsbTfUz4IfUIA5Wb/zJVgLnlwFquyttjDeQB
	 zjjE9Ffof7JcnCS1f+8N97nHo+Vc05RqLxWx5IP3vbVbj6HpduET0hbrrfUxuN+3r
	 6l8n5xq2K8M3dChoPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5j5y-1tkvvo3XqM-00EmgE; Wed, 12
 Feb 2025 13:45:18 +0100
Message-ID: <93a7e08f-8a3b-42cc-8d36-f570f02087c8@web.de>
Date: Wed, 12 Feb 2025 13:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chenyuan Yang <chenyuan0y@gmail.com>, linux-gpio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Zijie Zhao <zzjas98@gmail.com>
References: <20250210232552.1545887-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] pinctrl: Fix potential NULL pointer dereference
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250210232552.1545887-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rgoJ3QjOvQt09jtD0DLsUfO5e7MhvKcjufuUn6etTbSAzv4U3ac
 mZO2uQndJA0ga8cEN0mJUO7oXcxaYpMFY4RDMlOyxT+a4HIL4TGFY4vQPnpx0TxVMaDme/N
 2oE4qiIj6hRvywCy1WMJoEMADsVbNlUwrGdl4la3Ogabz//TqoALd2fRq5spvNDS0GXlS9V
 n8BGpZnWcfcJeldkOI+Bg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D62wot44SxI=;8nMv1FZOUoEfbybwFK41pXY7feP
 d/BWTy/ImuK4OscXNFI38Xsa90iI36mjKKyFNI0bPSN/TjPL5C519qpb3RVGa6zAIfrBmlmeJ
 sUNCUJBtKWIS9jkIMMGW9vUBSnJf+OeUtmSUe292FVTiHLl57aDN1dK2AQ2KRzwhFuH9ALz8D
 jaBb6kWanEwB6un6a8dvylEiAJL/4WExurSjoAPKbNWXaNr16dqTf1CGNRZix0YAhumzYMHYj
 g2d/Y1sfDSxZJe22alEHkOfWfkghKY0mWmdo/1cphaUoRNDUij9QYbmOphuQIwP+kV9uz97cQ
 ZzBPrSvGWlIseb2YFPW8Gk/LHpLiDRGwx6eGDae1oMezV7T1huDhSl8rEn4XvYGno74Qs009a
 fJ8zYam0zHV8pwEj1nhm7njhdgUT5/F/jz+vgoamr1bKKagjb0a2oK8YvjGOU1HgHAXRkqj96
 w5h2vg0ZprrCVqva+er7ymeDBteHG14HikBBHX38JMH+1ZMq8+G9eceRM/sGhXTSPtPOx8KSM
 aX2Y4epXX+DE7i2nD45dHh5UwcMzsPlPjz1sUJcGgy5cuJTDdn6snivIrR8WrRZztEOHxgDRK
 hf5pH8Xk3EqI8TnKGOPupUOUb1+mTbfsaf+2s8NFufajv7/5KjvMHcJLrD2aY4ha6uXAIQM9q
 g1Xmm+aiZW2S8E50DbxYtH10UDdOX3v1ByxFj2RsYu/z2olaf7n27tth3pCc6pphLAH7xrjrM
 hmj4NN9sKPyD/OVNIxk9IPWV2qCa4D58Odte99iRPUzv3mFdyPAfi32bZF1yp/BnW334i6hkY
 5LdKCxqHpLp1MPSNHBNARN6ZOJTm4C/7/k0HJWzwNgr6P8Z25jG5r56wkQ92hwspGUhxz2VXU
 xoODn8+KDzgUxfcdoXRyXE4XUQVs73s56X2GdxqxjbKjPk7LSFRR9vbZHSPbrhfru0doStKj9
 0FcSNa274heNYQG317LjsmIrhvuai1WJffle1FiZ6R3bfo/3goHC8tStc+3zKO5IZ94FAENWD
 hc9UW7SAXqZR5AUBHjmPiKVS4GLvRtFvKYhC1dA3fo/YoyVqPoEI6309ZlsicNVbHl91EoBZi
 4RrK9UmrpBmxbqMud1afkbfyMLHFSoW6H1tE6awMURL6Qf8oOy/zQkG+fVTN62C2fZyKCZnXT
 2ED5zeQZp7zHvHR6W2/50wp0f849FSAD0L6nYnwcpMM45d8tc3L61JGu3tu4yLJ5/X2X6kKm9
 swn73UsGU6FDm62xdjYfbcgMpDEzyDIVN0x+1ondfl0VnnfHTJNYXssze6O4QT7AxKMxSx0d3
 FHMwLtnTd+K80y45d0gRHNL/+umnxQCxX9HHBHnTghRAZdaIR987f/JYbhOevjhl9aYnnJlTi
 EL79gWpvgOLe2Eh5TSbJJoHCuoo3Ci8cQBvJRdSYB7jiJ8oL5xTWbQs50srgYQvjtO4B4jhTS
 xUzyDxw==

> The `chip.label` could be NULL. Add missing check in the
> rza2_gpio_register().

Another wording suggestion:
The data structure member =E2=80=9Cchip.label=E2=80=9D could become NULL
after a failed devm_kasprintf() call in the implementation
of the function =E2=80=9Crza2_gpio_register=E2=80=9D.
Thus add a check for such a return value.


How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n145


Can a summary phrase like =E2=80=9CPrevent null pointer dereference in rza=
2_gpio_register()=E2=80=9D
be nicer?


> This is similar to commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
> Besides, mediatek_gpio_bank_probe() in drivers/gpio/gpio-mt7621.c also
> has a very similar check.

I find such auxiliary information not so relevant here.

Regards,
Markus

