Return-Path: <linux-gpio+bounces-36959-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3e1eDJpACGpEggMAu9opvQ
	(envelope-from <linux-gpio+bounces-36959-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 12:02:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609655B024
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 12:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97C903004629
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 10:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590B23559CA;
	Sat, 16 May 2026 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b="Q9IrXNH4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86A405C46;
	Sat, 16 May 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925714; cv=none; b=jP2pFY0yJDPVuw5e50c3Mt1Vch5vhmLVZMQmgu2C4r8XYmKz8TOUAMDbwF6SdKrqPIVNOrRwRPcNNCZEHykyPfu02c1wk6Az3KWIsDX089AVWp42UDGAfnd1wMNNBL999J+O0p02ooEZZecz5VTAPeYZo7Tgc8MERy4yKGJfPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925714; c=relaxed/simple;
	bh=WNCJyuXDcjRgarawi4T/6BEesGHk3aIFrmldpSJfd4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7J7maRmyw7mcad++0dDupEQ0GMP3HSNbxGkLD9+GnUAS0nkxKIqD5r4qPOPLoXELG6ZIUGwopmSUDyH2Xc0l20rJUpY+eepSVZGUnUOZ8BGlrznX76O9mSuKyz2XRWlEfHSFm/MPu8nHFP01nPjdRlwt68L2gChJ2e4rDj52UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b=Q9IrXNH4; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1778925710; x=1779530510; i=len.bao@gmx.us;
	bh=WNCJyuXDcjRgarawi4T/6BEesGHk3aIFrmldpSJfd4Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Q9IrXNH4ewgAcho/ZuSUMjGNvVZ1jK9Zl/Z5AdFLSKjtuTWhvuIc7Cs8rWPYI453
	 U9TXXlWyCZdehqoatRmDX2kzwepYru6imIIAIq5FGA92GP8meFbPYKFCv3YamREdQ
	 jpP2bePjViD+Kp7GBNrSc1D6/VKc2hurR2dfQWAjMmnXDoMeH/Uo8j3zkDVWxLGPb
	 ISsH1Quv6b0U++XhJoPjf8OQ7e5yI0ppPKT640B0u+2NlumO8ckBU4sXk4uZpYaGE
	 PhZFLZUeP150o5bGVPvN8rIaTCzFE81eP7JSQbbsBtFtT5U6qVmLv2YjRR+DzLqOX
	 j7HKdYDnNuMrPEMaGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MYNJg-1wtWVo0RCU-00S7ac; Sat, 16
 May 2026 12:01:50 +0200
From: Len Bao <len.bao@gmx.us>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Len Bao <len.bao@gmx.us>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: viperboard: mark gpioa_clk variable as __ro_after_init
Date: Sat, 16 May 2026 10:01:12 +0000
Message-ID: <20260516100118.42728-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iJzxQtr+r1aMeshOTSUyEUyYE2V1hAalIPyn+DQi1wZ1IzQ3jIH
 iRe8Vr06G2tA/QkKC/5czkRmMrXSYxq7Q47JP7bq9WINJWHoD/GeBByV2fGptVYrtB76ck2
 P2vzaZ3jn+ELRsIrXISV4aI6unW32DQd7uS2gAye6pRD+HBdc6fh6w05rlE8Twq2xQvEXMy
 jZXNAg0ZImpDdAt0Lx3lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FTmYAT1byLg=;wZ77ptP49B/PZmqCa5mTPBMSekx
 zdeE/VGydE2csFGy+c8I0i8/xMePVAuF+BjZGOkVjhii2Dfj4uPPKzz/4D4k7JBMumbw2HgM+
 tiyNrIfXLGJlAvktTHmFB8ekyFx79i2c8qRyDNbnzIkBLl0cHmSEd2X+UPrJW6f97XQh+Xg45
 EpVCB0V4GR6UVCELK3yzqXU1WEeWn6ycAmNGUvz+l80WHO6ZAzyugSeN7ffyypGlCfJ+PTKoi
 KqXfxwO2rWV7Dp5GmjyLTEE8aUVAl+ktCjOnWpkiFQDBd3BmEBzoQ/FwA/VZz1iixIGzBMESV
 u5gASykdX7Sa3RKedot8+xBR3u1vqZgvk3ucixzZEMNFbZw9olYc771RlmW19xGVInwbYfWvy
 OolGgydXdq5rbK5OnWwg3m2jYle4390bwZuxOcTtdlrBDBUP11kW380xIsY5Pcg6n4IPyWD5F
 vkp6U6k5YM2Xox95rwWOfsourKcrjDjVRTZjQkNQupRHHBSDHio4wlK/AgT/Em9yYfutWCIYL
 HS9s6cRdl7a+KMOQKj3CYgjSz0hQxi8V/Qbm0sRSBcIeYh7zrKhc2d9pT3Tln9DI8ZuUblmMd
 +PazCXbzjjT/gQ0Y66gw6qRuOewc5ngOo51nQXkkyQ65Tsbj0WJEoUkkOYkMUN3dCLYPRnBmg
 2VwAzEcP+eAGrjfUVdzdd/bJZFoRFfnMkz5kbaUPNxYuPcYmp7arTc/5l4Cw/vLQRO+q+JTL0
 +dAxjguwsfvriC2V+rft1pba+96Vd9rlqrF91CfJ82lrZwF0SrP1wAQiq4QcDqZcE71D1sfbV
 93Y+jlDCfU9eZeHDrDgFMgTIoWyIQxO86kOhs+yXqNPNd4i3cXbEMi3q7iYLQ37Qi8cMf13IW
 lQe5TNBG/qzXtMwEIhjVS6UZ8SU/AXUlJDl0eYrQTxs/aDa8SQWKhNP0v6vXH71FaebXxP8s/
 lGvtvZWfAQIjQ9+Gi+tILo+z4Bpey+UnefYLjNTCxCsfy4dEdB6WtjjWD2P10yoZTucHCJ6ik
 8E4Qt9ERLPLkBx5YbHW+Syws7ru8wyfO4vUYc43h+zom70AGfKL0/wyslLoMVmnHxZ5UT3o1q
 v0+yTV016iNhCcXfI/a2JW1e0S4Np8CTkx6HUTPPnXreVfNHev4ZLIundy31qD1YME0ssHWz5
 pI9HDNjxDvfp6hVTQor40iImvHiLs7V0c00YtMqHYIjR9BntSIOo3o2W9/GFawCaFDuvKN7Ns
 f/VsdWpgFM+lpYU7fqizeSCpqyBzYcWyuVKOjseD0+iRvMduOKSWBQXXD82P8MkQYcBJqvKED
 tsUS7LZ3xjU5I0dYuuYUDsojWgkK4AhvBD0tgwT/jmLqua+mA6+cRBnaIvQZsaqrpMD9ZHWmN
 9bViW/K8SaI5KZHToDgt7z6y7/ATcT45lS+4QOZMxtTRUd7jeJ4nzBDTdZNgJUSUnFWclzLjk
 AylYHa7/XAzb4aglGT351UDYeisTy9Bpy9TW2igQCFFiAOv1IuJW9U+kbDk4sYHCR3pOFNb0f
 fykfeCN01dqF9Acr2yX20kdQsrJkS5JG/x3u9XEGJ8GgjAqsUDhkfTmp17W7SiQ26199amn21
 9uKnxOUNr3I/FO8s3hp/x6mV4ARdwq8LM/BSMVxZCW0VjnXrduv+OhGoiONeXnnyhYUNppHHH
 I2oRPUJj2ZZ69pSpkaelr9KbM9VxVXiKdwzlB1/FSq6vagJBw8bH2qXdezAvk7ydZevssfMpP
 qNOOqBT50PgwdUuIAP9fUFdnWIfpgs6u0cNqJGSmLxoH0iALHWLKTfhPL7ctm4HWr9pxgu+5G
 qfsVoh0ouvYeTv7nQHy4vXsJR+CifODXj3Lk7IivihNs92EXvlJZGIwpFf5Dq1PjQxSpyoI+8
 dJO54bZjYhSa4FPxWMidniNg3xZbec04F2tQe/Z1jSFQbYViDiYMlM5Oo2jCZDAz/812I14Nr
 APXduHBeNCTn9RAYpwloqU58RyS4kG8RASIkVQX4IzgpHkFDBxu45oKq0YWq6wgqoblqfpw/H
 XlCcgd4KjcIeS84GblVb6VDNYKtfKgIJ0EE9n754t8LslyBGF4wUH2PVWaEDxYLesB0jcpi0w
 ZvcKN2u1puWh8yvS5dCJQqkV9zbsEQqx6E3OJk2W36aKBE7nYoG6SqU2Pd7sAvupGIHIV5fEC
 2XoDZAsp1U2HnotPzoy2EczYKUaB786XxYpWoqfAJFNjInYB+KdHzu34w5pEZWbsgSP8PJ5jk
 A6AnI5FNYEINNkaImsIS9k94so81wBPmVQg19URoepjTOB5hNRcPKe3zP7e1WIhF8e+ZDWnGi
 rQY+mDtOS0Q3fEx1anwJQZ9/nybwcsxoE/cccvvDwDzTg+Y8vcZW63sblC0Y0qMbmtzzkfkJ7
 KtzXrydGQluTH8xZHDwyx/FaPrz7dxdX3TfNgKnoBDfGgLa2QtrEbu0MP04usXGp1ilESTPtC
 Sa+dntzfm++mufc2kDFUb4wNPyt7ZcJgjkgXKhFnvcTME5BxToOsH8jp8DiHXU1WtJ7xjPCF1
 mf19ZC9v5M93AsJ9bFJfRJo17tHxI643Q9utLZe36XvVuISz+2DAkLtYukO9IQlXu9x3TqXAh
 48PNQLQ4xBQvT2L/nddZkUdEloU2hdVIF3n4S9TncL5rHtQgYYqIhaCMclcmTUkgeYu93623W
 ri9c3F41sW53p6uL2mMbmwupE8fYyVSdmA3ZH0erNsXHiYjH+FkeunudSFk0RWqP86hcPUHRB
 qX4zqjfvqJVxkIpeD2VoxTO277XX5B/MH+pYdhhc/+DmB0lKWl5xbM6RYxNsG773JvKOkx0ie
 dlkEmrHqoiJkjYqPQrp6TTNFsf+wzwQ4vm0ol7s3BDhanWYolUNVjU5YVnt+KLCRFxm1w/ox8
 anvwaHu7CD8JETRg0di+7capdeVgDzg82OGNnAqFbJmNQ1kppKRe5Ce47DR/VnyoosOiJ84h9
 CYhJfNIIvWvoJjBjin9wSA68si1SfA4JuY3qjfIJC+5vIEZjOff/t5uSmvtXxeC5VkofynvYh
 T3So8flib3ucpbRXbQGxR9PkJWVqdfHp74dH1ijZKAyVytc7gxINMcGzze9ukM0rNG92pVz5S
 nQTRF/Lu1Xp5kDvrMAIPvHupVfa/6gPRuP8x9F2jfagkPiSLYrSrW4cq0zIqPAXpQXWXMbFIS
 phNMq0eQTjqJcMW/nkyupWVgoiqZQF71NSW1xmPjtnjw3MAjFpMHfgCcUMEbUlHdsKJg+9Vob
 pE4pd7kJr/KuGwCIQAA527SsX4lthpYZ/eiGBqfpskyga3ANbDIt92ErAxJKRZUmsv5l3uJET
 MaLqj9WsKGeAmT5OuYt5kYwJxKF9od83f036o4b9YCS/Hh8BtYpWNICtH8t66RvnM1rky4STd
 bpxX2h3ylWGZN+pIMvZ2SXb9dqtQ6k0xCqhFP82PYFFIVM47irkR+VR9vZ3kP3Xc3LzoXXfjO
 amlX2BtEQ2zcNnpZsCaZ9ZhwhlYSPmZfadN3AwlAEgLr5QS3RmbuR9fcAASLBf5motycWG1dQ
 J9OCLE/Os2qL/aYCIhiUgPSIc6Ri2NquJRxtn86zMAMq7obbDkhPc+vDdc5JeMeHWaCI/rfRc
 3cumZ6L0ofP8eqJ7nCIakYr77PHniAqiWjP4A5qNMUk9ks1zcpuF4PYaTp3oNL+t6HHlulk0S
 53wHnUhEl4777PdsWQHk0mbLoLMyGVmiAQv6356QBUcngOlTEidnEdkiPMgrgHjyJeQ7K0YYD
 c4wWvwVbd7eXfFpintwn3vtRjpIhJoVyV6zQbPyDsSuZ9w+Tbq5kXD+ToOs71xGVJ/kzZv/4c
 sSyx9Za70NiciWe6KOfteZDFxiECVCXQvIrXaBeGtFdWlXI0x14wp6nockcuRTUFsUXpvXvfE
 HYI1oLHwJ2uPs2WNSlp6zeQi/bo6sa3sO86HZYjBKqdz4ZU74k0NhbId+ZNfTzzy9mL2k0C1P
 X3TyUd472mjAtFUQd8FDzxhK5n9b8xp2fvhryBpsNx64FQiyBwbaQ8jkQjji8Ryn4FT/hjcfh
 rC4FPB+RjZo/HlQj0Zs85PQryqobCMfuMEvjjT+H+PtR6pMlDBnN1yHEuwVIVJfmhwo5S2PdG
 xzn56rMMLqFT40pNDeM6WKLStH5JY6ht8no7BBWfWiOiEehL/ImdXxgFZWR2sNFdwKgJaWC+f
 lV78uX8lIl3YLWEyWcwLa8L+sozqqLrd+9fsLLvsesDH8rxQIrZfKwisC5JR39A5k6mcqLj+I
 ZN6Ipff+uIZO6e6Vc3nFnWnjAfvz3CoDAJ5EU+voTvOCQ+1loUeSsBLEzl21TbRlEZESUQYB1
 DY3j3Q5F9yZS7C7EvbvZquakIYBLvYTnrWTub599Gq0IVIDQVZ/61Ewmem9jC66c9IjKLjXXZ
 IILqBithkpgEh3OOp5S0VS+WQpydJPKB0gY1hJ5TOhzW5egrXHYRpA1S4er+Q9T3WZ4m4g+QD
 fY1YfYa3yDBnYL6JnWa+oOnMy+Qlts+MGux8Z663AB2ZSxwJIkEtPues4gFQgucWVN8fvbObI
 cxJO1XCz83nqx+9T1qItEGB5FAXwYRL5b8Pbowhwmgq/f1wrdRa6RvFqO4HXWQA4EWzwojbWq
 wNGxyfdUbEFfHfFwk9DI+GtzlIV9bkt9irtGtbLVo379v/4aDC/XfqQCiKFLGB0OmSFObbc+o
 GS2XwXocLUaAJRp9GWVF5Cd4wXtF2fPrC2rmhXsgrQoEej91+SI8wbowQMqKl2gd/V1EQWDJW
 VHPx0qGtPS8z0O1UwLyKNS3amlaFe4L4bX5K6WJGqVrl0fIP9i5b8JplqjE0i4jsnd5pt5Eb8
 JLBc5F3kagON7nG5p3fjQaTKIcviiALZI3smxH+P/UKvTZIVxNUydPF41L1l/wNZ+9RExARrG
 CVAZA0pnWBO7IQyko5SBwE5wmvfLb5sUzZHixQLJapENZ0WVIXX2zrJXZY8eR+RIb18LnOVGP
 roKHlrYhZlpriv4QOxc0ixm1dgtMSU1yIPtUF6qHob1A4eOkEF4+jMJU1tSPCAAxDd/DxGH08
 wMIlDKmkvsLJ0F0z46VzZTgv0KCCl8fkPDl4Qv+BKQmiSG666IelfEdY/zwITKq2fbBtGSbAv
 LhINFFtcCD6Tx+cVF3w/iANJidOgNbXKP1KdeCAsHmJZgHANDEawZnz8mI4BSjRtwPqn0RzOz
 Rv56d7QqrFnUaPkRUayVdYVoqroYNRrlfy8EVZgLfLrBxPMBcZcRlZDwClXbN+2667vh3lTwF
 oUGFHS8I11P4Yy3cmBp6KJ79WT3wwBvl6bT+Vs1tSMRTtJWnqeLg+Y8Q9lTRDWh6t/mnOhSKu
 m2VIeP4IPSYVKYdVr9Vw2LRVxzIa4oUMNFBX6CgwD6ymApsjtfzpSPMLVYWmNlHHZ7i4jPgrI
 heQ9TgfE9ipRQmiJYlDHdsJTgqgZX9PgiJm/TZnePLpFCISTpOIGOzoeExR9aM4IynfKdC9Le
 BPrgSL7lA5TYHgw==
X-Rspamd-Queue-Id: 2609655B024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.us,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmx.us:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36959-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmx.us,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmx.us];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[len.bao@gmx.us,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.us:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.us:email,gmx.us:mid,gmx.us:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The 'gpioa_clk' variable is initialized only during the init phase in
the 'vprbrd_gpio_init' function and never changed. So, mark it as
__ro_after_init.

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 drivers/gpio/gpio-viperboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard=
.c
index 89087fd48..4e6442390 100644
=2D-- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -70,7 +70,7 @@ struct vprbrd_gpio {
 };
=20
 /* gpioa sampling clock module parameter */
-static unsigned char gpioa_clk;
+static unsigned char gpioa_clk __ro_after_init;
 static unsigned int gpioa_freq =3D VPRBRD_GPIOA_FREQ_DEFAULT;
 module_param(gpioa_freq, uint, 0);
 MODULE_PARM_DESC(gpioa_freq,
=2D-=20
2.43.0


