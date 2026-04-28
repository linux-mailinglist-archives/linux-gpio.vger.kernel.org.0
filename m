Return-Path: <linux-gpio+bounces-35734-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBN0G/gd8WmRdgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35734-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 22:52:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EAD48C09D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 22:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4958A30A3D0C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6E23624CB;
	Tue, 28 Apr 2026 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qzlYBfAA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A31A9F8C;
	Tue, 28 Apr 2026 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409471; cv=none; b=AZWTUGTQDOM1wlNZgprNWOLLnAdm2ftmKYQTfsNUrhf0GfzkW34LizdDDCc/5pyxKvfhogQKNDZHeo39UVi8DTw5sxIPOCk3jEZpdlF+hBHx3oGb+Pcl4PfTo4hsPDjLfAbtAfXzAx8pRmbZ1nDMrU+9mEjcqVhVJSLqLw3O/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409471; c=relaxed/simple;
	bh=6Drsq3B+zj4RrtbrT39Xp5NurdLM5uVjVVnCOJBkyow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QU15DKQxMyh1D0AGWGvY+lQSWccPztnLF1Fb7zNOw3G53grpgsM4pnogIRKtUUPkYnAty7/L2IPv/6LoKJRWmYFVs0o9tlooEkx/8z/++bNJ2B3/bpWXwJgM+Co9wmdMGxlyC5bv9cuzJwLuZ0kNl7uuVFbEJDb4yk8ZmPWHmwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qzlYBfAA; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777409457; x=1778014257; i=w_armin@gmx.de;
	bh=1kIbdnwNe/JBPb7ipaW1ekizUpcrUxxJpTiCdeLWkfY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qzlYBfAA1cVVFRlCF8mx5vZx6EAMtH3zv6nGjPHR5HXr4RELwAapGzAz9n8t/3xc
	 XkyE0/guL49xz4Rs6OwIb+EHl8+HjvwVHn5mhjJVr312TRCMujDR1lRFfchU0uPYn
	 cQ4WxZBKCiDMJazDGDBmwUbgUpwpJE/63JJFU5Z3Q4l/xJvE/Ptzy0gzUscpPsvSn
	 N55Nvq+bjt0n6AwcVYUzvmEAx3bcTqVDdYI6wv4/liRKXEPhhxNTVe1wTNXlGyLo7
	 /SACPQyUwW0BEbkCqXd8WLsmYY/AxIxgZej2D+1XZv4nQALtcC5rjmm2m4DoN19So
	 kPhzg0FtRQSDxIoETA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9yS-1w0qm30k6M-00RXYL; Tue, 28
 Apr 2026 22:50:57 +0200
Message-ID: <68e69fa1-8e79-425c-b4d9-35042b00b392@gmx.de>
Date: Tue, 28 Apr 2026 22:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 Marco Scardovi <mscardovi95@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
 <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
 <f4979d43-f61f-4387-8490-ccec7043c940@kernel.org>
 <bcdd110b-489e-4f09-892d-b2d6ce4b0ff0@gmx.de>
 <20260427045731.GI557136@black.igk.intel.com>
 <92b504d2-3d6e-4380-883c-be6b50eec25d@gmx.de>
 <20260428075941.GQ557136@black.igk.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260428075941.GQ557136@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xnE0JJmefZimQw+UA0ULe7YTx/U4zTwNulBaL43rMOHSi0YzS5p
 cW7RShs87Fddgtv12rbkWiFGxZZKxBw/h5GzimS3dGso2NFrM89tbAR4IKzqqxWm5IBQ+Mq
 kuXiXKPWcjSWUgi5k3gvZpe5+lCVJP1zMEqDVYmXOX5p60yPPBjrTRXDQ65rPItcYM/VSSF
 Hu0DDIP1MomtBAvTyCBcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W0RFn9dnUeM=;gbTOicJBDn1zwop0WZ8n3QCsauT
 syAxNMIrWh8z4pDSTnen6WRuLS2+7VmydNCldreStvjbbvmcA82zrxSvLkwSzUjc3PKVts+he
 N4uOqHvmimG4ItCpQv/3xX/RVGggYyYCwZ34XwkLm7BrtAoetxro+CGqxDeBwV1haqq1P4lFd
 Lw2z2RaXMIzyZY18j90hui1mtYjTA/Ysm4rNRwfOOq8q00PTqavYogAcOvRPIpw07/N6z6VI6
 Y3TgKmnijeTc9uaSNNKmFqbGe9h2G6cNXAbZKOAdJh05Sr0buRNmI9Sf3rvPJO71gBRQt96ye
 NpfDODb0MJX7J52wxuiGS0QcijTVZ8SncmTPUkbgcaIJUWbDIOClXjj8Q9o4cX1y+b2j+61ZU
 cRV8oTriz9Rvlt0K6jAo2jo1vPXvDIUc9fD3aYgd+Oba83tX/Z0r78Dr49hy7IdRZ4xUED+ws
 shGMAH7Qr8uFZ2FkOBu40/C3hipmDo3/dSDalY/e3Jirp54E1OkpuOgEU1JBnQk1WgnxhuGO+
 lw1nOfLU2Zamv+9u/hxQl2ku2KnsYuVSmoCy0FapzduibufwtF21p7i4I0QTCR2qEu1/YY0N0
 QE6VGrlL6hID3ckbkRVC0g7pNNuw9cw3O1uu2SIEbt0meyCUP/prWmf6hP2dYZTradheut6vZ
 nkCiFX3JdXmNozs+EwGyjNlEsKkH9IpXwmdCn7iMJaHJfXIMKgemKyNcAUne25MbsM+fNdfP5
 KdSVZrmh48m8l1fSypCgSf19w/+/VHouonLN7wmn7p9QRwZjeEffatshC2Fx/cF3wGnOvA342
 6nwfs98bOjKUmBKNqj2gq+1qLcBFL77ClhFlJJ3g5l9BZfhxu2NVHs0jQpy4AhaaNjifXywvk
 MuU6PoRjMUPS59gmuRSx+LFNCEygTjABJssCSE6zkVnNSeax8/1nMAkjb+A3+aB4nxIHQYDw5
 Q+0TWUec5XJ+5tZ/ahfyYMrSuzlQS7DSr6mSLYRwOvTSVODoAuAgNu/LajqIwK30gFRpT87Q8
 IFoXmu3sk9GPRkpHnOkjuMYyOpZh62WR5pYRJ23h60v5emYQEFkUsINmMsNPen55mep8rBF9M
 pb1YcVg3I4jvctJRaFzG2N08YKFEgwWJRcBaV+Q36wr4DZzfmONywuzXGgWjalQLAUgQNk49w
 KTKJm5TauPITCFsMppiizbhMBASKC3sDEGQ4WyRL6V4xf0L41JJ1sZ4r+xaCP4eGim5aPVJ3+
 NRNBDFIkI5rGe1R3jWFBI8Sb0pdXZMmquBbx/JZxpLCOSIm8iyk0/OxU/jq+VQ2yAApBZeNcC
 VVwOaGt7kpMG/V09E+wdjcYsIqH9hZG2rQmvqbCZKzfTAktypxnSBzNjcstFfX41mKGfWqios
 5PvHlntnK6izChKSIUXKGZpaUaTZadt2ARvw2b3yYuB44QR/OHvwLPb+PGG24t0kCmskg1otT
 JFBp+Zsk1fOp5p4S8scNNGptzsgtcTBKpQaoW/1fep3C+dG7fMvf9M1P/lzwdjKvluzgp3+63
 45v6OQOlIPg3Du91CZ50hTAgm/7SGLJSYW3Y0hfl7z/gcIHNvDRnw2O8L1+6T9qbmRMGDOuL0
 TS1Kj24lgui/VRSRIqEt4FOu7l46lxY5AulhPLI3+GkKLP4Hd8wOmW2ajtBHPadTxKzM44kVD
 VM7rrvSiA6pGerr8kVEF/hv1IBMJ4dv5IVv802ixjNlMPrCTugxDcovMnGsLB6xmr2WjIMt8o
 Q0FOfWj+c1u6J1Ns4ogMLKJau7kntbXFRBV+Q7y7DQpeHndFo3Pki+U2/c0fCqCRljBH1IkmJ
 Fqkchcvbl73kZxCcnngF7d0Io/p+CAiLaia1mTKoPLgsPVnM8nVjyH8e7m3KOTJj5P6JN+sCg
 cTDsAnYgnBf4cr5XKbkP834hUZwj/6lPoTBWhimO+Seu13vKuHlCbsj8lMjGtJ7edkYp3fpG+
 C2ip8NtZ1d1F2M0lg0NI8MihdMir6mCxP55gBtA2A62N9ea0EHTzobPYaBi0FN45Zvco0+b3X
 oL6d/muoy2zaeBt+NO2x/mlTr9K7zLkbHdLi5EQRsI4WKkV5yHZpj4M2uKgRVAuYrRLaDmO8I
 bPzfb53ac9hbsX7xko9pRZRqUq1di/Eq9UKcSYl7YmmuWR9tI64I14i2Tx+x4KlCxYfc418/v
 RxjbTFF5BxmN7bYMB60sV9lgP99SSLJGhBSEUEq3SwIIJZSTDcjOIePVVtsJtyhMNoDCpai9e
 e8GBW3eAiNIoyetFHSIG0lz8pCJqAfhzpMLAA5J8jKJmftnO1SYNlmZFhahpu8SgcPmaKzJ99
 xd71E7EBsbADg2q60LycykRgwzW8wgfXP4jJJu/ye8lPfxnMEVNoEvwXjzjO8LQwnifNsGrCx
 Dx1Sqf/M9+ifMdkjuqoFIH1OUEMJ/C9WdDu2D+GJb0YeLfF3Mts9spvath/Vei20Lf41Mm9Yy
 ZCJvQ6+dd/RezErfNX2CbFMSh65tPgWcsdHZfWfHj+MqDa9Yd8kmZ2aU7rATvpO49L5PmEHKZ
 ekdsRcIwZYjDuln/97KraIar8uIdH63y0/Z0D0HHzLdMuzxWIjwPFa02ICDIixqtfvKyY/ACL
 NnkeIiA3RE/0djH2V6ja9OhU2iCszXsqOnusf6557t7QuL3txAKP5hQs0bH9Uyku8p9s6Pzy4
 hdjOW6VO357RO7m0JRpoei9vj6jVTJSFrScA1jdOeaOHbj2wF7jjIPn6oNOJm+LDZlwCMpUuK
 CPjB+sHmAqAtBl9g4XTKgAfRpiRgD4Q3donIQHis7LXXuUSJiacUcUdMLvzwWuecCUxL4AWIm
 MeeT46+6IfydHLTi/D3szX+/VPwSXb8e+XABPxoV4u/lT0UtvQpmwv/g7S/QeeCeHYcIIbNdn
 +GxoSGOOBp9Z01xg+XIRc4q9bEU3M02LtLJScRVK56eAt6gPdZN3YqxnUC47kFDEJ49caAYft
 W4crwXGnd3G/sjeGWO9VsEUt6yQfPoZnYuBRnb98nQgQBpEXLEca0MExdiyBdWfqkPS/e1kcx
 Mb5Hvk59KV440or8q1X6EOMtsckgcRtLkzLbdAJUqt5yLD3VFZ7n19YZkqT21gJiJPwHUo8J+
 cJoxjsu6QJ/DWqpBw74ATkErT/ts4W8OaePg7KK9no7zr6f8P+moUH8zKaf05qkR+N4SGymaY
 u6jhtwJfOPbBXDcrzqIYnPoCy6uSwQJoJrQI4EUr4ZBiuJLSNLiieewfRj0hQccadKlFXwU6x
 XY1/eY0cUHFVLWqC6oQfPGV4qjyIJrAB3ZzYmXKlsoBzkEz4SVxS4DV0VxTT7U8eW5/+9ZDU1
 HNQVDMCBzfGAzg3Jk3N33LYaX8TXyHzHi6cVE9Vw613EzD7zEpyHhbUqxdxyXERoVUj/GUwHb
 IKsGqlCJpEYHB1yyBzxLGRx4EMeMSwPGA6a1jh+C5W8fUx9ZNUJEhObrkTiJeID4NIYsh1VMJ
 Bt0aRfk8kxpOBwJl48+LN6RyOrwXWAEQMoy4o0PijVKLe4t3rcalWbktY+dHBvFSS1qIz1oW/
 3OmS/sGtxocVxIDj1zLX/1XVFN0NnsS99UY7mZLwNE3L/q8+vF33qXd3JSdRLx+VYDTuRnKfX
 +ELH1O2iVx5Z377Mu6w+M7MYfgIAZPG1l/cIIgT6tfOUeVePEJDaLGUPtQxB/CsRuz1lydjRP
 p5dCOlb2PREuJ57tB0zlfewlSyWklgZiUsbCSo/UR6H7hG92+F5gg09rEC+mJ8CkLxLJa040d
 l17Je8q+0QK53oJXMrfZswmQRz9hmIlL8W56TfffW9RHee6rk2Rbj/A65MK50e6fROv7/IROf
 Rv03QiG8zTmVbTCo1FfVcj206r5ERXZfsIgs1NUtJTI9IUBUJID8M9POsj4Wi32oiLUSjZF9H
 P6J36Z6F5ZPiETMN0f8LlQjujS5svcxrEegkVRaxW+bUUdK6BXx7/GOS/HTqrNtIGBrfvBALR
 8z2ehApnVHoK5ZriYM4zkDM0C05ThJu1ssgpN2Lm+Rd0zblCd71vUbAQG7mVXZLMImSz0tXTx
 2JN19Ls0E7nb6l5VaLUCFq6ex54dwetiRf1dzLSz6oHud7IuwL6khMPFlkYVTeer/Lh84JLkh
 AZ5Yz8BQlKlvyns7ncddg1odEqH2nVDF6Sy/zjTP3VBFiEGrLb+JvygocK+OHDXWrO0iRlN5c
 lpVyDmYVX98UwcLD0XYqqP3q5VyWVemW60L1YuzUnaPLmHNGbf2DEtKy8FERKBNGjlIviqZC6
 /0c0hUr/Oz3vYLASZLfjIhbPFeW7b2u6wWXtKo+WpVr9Vx6sZ7fk45HF0Ggq/AayUJX79wt05
 oUj3UbWFNWGZWTLywg1n0m8+i541C3uwio4O/XiDY5U/rtd2cgxrb14nzHfcc3grUGzR3ki1O
 vRZqd46GLsVJYJG8toNPCLsC3+EbwEbhJvQl7EYQG4CakT2PEQF4GHdDCF2EKd6NUuhcAurAq
 6VteUQta5+SpU2irXrjgT6xlbx1BLGPlOjM1pfkHVw+RhAXji1HDX3C9ZKox/Zfn/8lDvt0BN
 xwCKyB77Mx2aJKSQWL6giQUtVIfDx7SLZ1MKyUuY89CZZ0jnA63UX9UN1Lrrxxp0wvDg1ck8O
 q+X740PhZH9DQipqHEgPz1v3JBFz/HpbzblHF4pIT9QTGeyPjW8DsMxwlYN/FfdAqKjIZzIKh
 WW32cMWRqUDEWezuqQR+4b92CueF5gculMIdnW3NdC5ii3yzlUxLxjoVzYsSle/5HRske5eBt
 iNi45+mam6aRXaOlE0uvXcsGm0CXr4n61ntQioIimq84pff0wPom60HfzUOdFOTaF9x99JMpo
 NHJbDrT5yAu8TxlwGR+pigHhdLujdvz85Y0N3wDfZHANpjT8pkCa7iiso7xjUPx60bbr135qv
 BM6NDtoGKSDmMNGgaisEZPkW32axjTVKypSi+2sPbi5j8Fk3CtBIA5x95ibQ0HkwnQ6uIPCQS
 aeGsjUoIB/28oneWpIIt9DefZcTPkPy5mlhmHdTFEbsMdbV5gqCSTfzq0r4SJV7DEVGB+bGEB
 Lx4IY+AL9fm2wzpxEBoFHvRfI4gph1XVRStjGSPgFxAUr8oV4jkjbOHisuYqcpGJ2xjwa2cOe
 CXe4xFrshpjInt9vlNPIx4JOzMIKzl5nfMErqn1YOi8AtM1gDk9vBtz2u/wN0fDkn+srBBUW5
 AVt+9Ou5TuG9SH3L4K+cB+HNWkV5OniHH+7c0bryB59xLz67RoPiwMx+SVaw1++ILLmYK5nJN
 KfvT9rYrhEScIcZcuH5k30UUg1d05voQ8E9gs0p2oaoqDMqzDjy0mywWwc9GWxLQXOqKsQFnO
 Dbl9wThCJRE7mc8bU+WY1Zkp2U7SZGJ5UeHbUQTRSPfp3PO2tBrTcck8WhRUQf/qsZtBCFVIu
 fGNrIELajML5drGaT5g0aZwLD5cLhTjCLJ94UDMIVpkaERsZnTMtO1yZJfeRK/g29Mi5LrxTE
 45hmtoTmjdKv2CgwqaZxu7SWz1tCJ7RhGICrH11Z4jctLgLN6uzxip41Cm1l/7NX5l0n5sC/N
 gzZqy3eNwnC2wuDYzmH2kiLT7lUH8dfNsyjANjt7EEGpK07+Vb51jObMTqFBGthvromDsQ==
X-Rspamd-Queue-Id: 18EAD48C09D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35734-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gmx.de:email,gmx.de:dkim,gmx.de:mid]

Am 28.04.26 um 09:59 schrieb Mika Westerberg:

> Hi,
>
> On Tue, Apr 28, 2026 at 12:09:10AM +0200, Armin Wolf wrote:
>> Am 27.04.26 um 06:57 schrieb Mika Westerberg:
>>
>>> On Sat, Apr 25, 2026 at 10:41:46PM +0200, Armin Wolf wrote:
>>>>>> according to the Microsoft documentation
>>>>>> (https://learn.microsoft.com/
>>>>>> en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-,
>>>>>> section "GPIO controllers and ActiveBoth interrupts"), triggering
>>>>>> GPIO interrupts marked as ActiveBoth during initialization is
>>>>>> correct as long as the associated GPIO line is already "asserted"
>>>>>> (aka logic level low). I think the problem is that we also trigger
>>>>>> edge-based GPIO interrupts _not_ marked as ActiveBoth.
>>>>>>
>>>>>> Based on this i agree with Hans, except that we should continue you
>>>>>> trigger ActiveBoth GPIO interrupts as long as the above
>>>>>> condition applies.
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>> So maybe something like this (attached)?
>>>> Yes, exactly.
>>> This is good information and definitely scales better than the quirk l=
ist.
>>> The linked document also mentions that there is _DSM under GPIO device=
 that
>>> could be used to override the asserted state:
>>>
>>> https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/gpi=
o-controller-device-specific-method---dsm-
>>>
>>> I wonder if we should implement that as well?
>> I already did some work in this area, but i kind of forgot about it
>> because i have no suitable device for testing this.  Maybe someone has =
a
>> device that uses this _DSM and can check if the attached patch works?
> I don't have devices with the _DSM but few comments on the code (thanks =
BTW
> for doing this!).
>
>> Thanks,
>> Armin Wolf
>>  From 2e1dc51c864802c05c3a9e6b745dd8c34b4b615b Mon Sep 17 00:00:00 2001
>> From: Armin Wolf <W_Armin@gmx.de>
>> Date: Thu, 5 Feb 2026 22:39:35 +0100
>> Subject: [PATCH] gpiolib: acpi: Add support for Microsoft GPIO _DSM
>>
>> Microsoft has defined a ACPI device specific method for determining
>> the logic level for which a given ActiveBoth GPIO interrupt should be
>> considered "asserted". Such GPIO interrupts are normally considered to
>> be "asserted" when being logic level low.
>> Being able to override this assumption might be important for firmware
>> implementations where a ActiveBoth GPIO interrupt is asserted at logic
>> level high.
>>
>> Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringu=
p/gpio-controller-device-specific-method---dsm-
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/gpio/gpiolib-acpi-core.c | 67 ++++++++++++++++++++++++++++++-=
-
>>   1 file changed, 64 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-ac=
pi-core.c
>> index eb8a40cfb7a9..f7c58ae4d423 100644
>> --- a/drivers/gpio/gpiolib-acpi-core.c
>> +++ b/drivers/gpio/gpiolib-acpi-core.c
>> @@ -15,6 +15,8 @@
>>   #include <linux/irq.h>
>>   #include <linux/mutex.h>
>>   #include <linux/pinctrl/pinctrl.h>
>> +#include <linux/printk.h>
>> +#include <linux/uuid.h>
>>  =20
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/gpio/driver.h>
>> @@ -23,6 +25,14 @@
>>   #include "gpiolib.h"
>>   #include "gpiolib-acpi.h"
>>  =20
>> +/*
>> + * Defined by Microsoft at https://learn.microsoft.com/en-us/windows-h=
ardware/drivers/bringup/
>> + * gpio-controller-device-specific-method---dsm-.
>> + */
>> +static const guid_t acpi_gpio_microsoft_guid =3D GUID_INIT(0x4F248F40,=
 0xD5E2, 0x499F, 0x83, 0x4C,
>> +							 0x27, 0x75, 0x8E, 0xA1, 0xCD, 0x3F);
>> +#define ACPI_GPIO_DSM_ACTIVE_BOTH_POLARITY 1
>> +
>>   /**
>>    * struct acpi_gpio_event - ACPI GPIO event handler data
>>    *
>> @@ -216,9 +226,11 @@ bool acpi_gpio_get_io_resource(struct acpi_resourc=
e *ares,
>>   EXPORT_SYMBOL_GPL(acpi_gpio_get_io_resource);
>>  =20
>>   static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpi=
o,
>> -				      struct acpi_gpio_event *event)
>> +				      struct acpi_gpio_event *event,
>> +				      union acpi_object *obj)
>>   {
>>   	struct device *parent =3D acpi_gpio->chip->parent;
>> +	bool active_low =3D true;
>>   	int ret, value;
>>  =20
>>   	ret =3D request_threaded_irq(event->irq, NULL, event->handler,
>> @@ -248,18 +260,67 @@ static void acpi_gpiochip_request_irq(struct acpi=
_gpio_chip *acpi_gpio,
>>   	if (acpi_gpio_need_run_edge_events_on_boot() &&
>>   	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)=
) =3D=3D
>>   	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
>> +		if (obj) {
>> +			for (u32 i =3D 0; i < obj->package.count; i++) {
>> +				if (obj->package.elements[i].integer.value =3D=3D event->pin) {
>> +					active_low =3D false;
>> +					break;
>> +				}
>> +			}
>> +		}
>> +
>>   		value =3D gpiod_get_raw_value_cansleep(event->desc);
>> -		if (value =3D=3D 0)
>> +		if ((active_low && value =3D=3D 0) || (!active_low && value =3D=3D 1=
))
>>   			event->handler(event->irq, event);
>>   	}
>>   }
>>  =20
>> +static union acpi_object *acpi_gpiochip_evaluate_dsm(struct acpi_gpio_=
chip *acpi_gpio)
>> +{
>> +	struct device *parent =3D acpi_gpio->chip->parent;
>> +	union acpi_object dummy =3D {
>> +		.package =3D {
>> +			.type =3D ACPI_TYPE_PACKAGE,
>> +			.count =3D 0,
>> +			.elements =3D NULL,
>> +		},
>> +	};
>> +	acpi_handle handle =3D ACPI_HANDLE(parent);
>> +	union acpi_object *obj;
>> +
>> +	if (!acpi_check_dsm(handle, &acpi_gpio_microsoft_guid, 0,
>> +			    BIT(ACPI_GPIO_DSM_ACTIVE_BOTH_POLARITY)))
>> +		return NULL;
>> +
>> +	obj =3D acpi_evaluate_dsm_typed(handle, &acpi_gpio_microsoft_guid, 0,
>> +				      ACPI_GPIO_DSM_ACTIVE_BOTH_POLARITY,
>> +				      &dummy, ACPI_TYPE_PACKAGE);
>> +	if (obj) {
>> +		for (u32 i =3D 0; i < obj->package.count; i++) {
>> +			if (obj->package.elements[i].type =3D=3D ACPI_TYPE_INTEGER)
>> +				continue;
>> +
>> +			dev_err(parent, FW_BUG "Ignoring GPIO _DSM due to invalid data\n");
>> +			ACPI_FREE(obj);
>> +			return NULL;
>> +		}
>> +	}
>> +
>> +	return obj;
>> +}
>> +
>>   static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gp=
io)
>>   {
>>   	struct acpi_gpio_event *event;
>> +	union acpi_object *obj;
>> +
>> +	obj =3D acpi_gpiochip_evaluate_dsm(acpi_gpio);
>>  =20
> So intead of here I think it should be called from
> acpi_gpiochip_request_interrupts() after acpi_walk_resources() and make =
it
> fill new field active_low in struct acpi_gpio_event.
>
> Then use that field in acpi_gpiochip_request_irq().

Good idea, i will implement this when i find the time.

Thanks,
Armin Wolf

>>   	list_for_each_entry(event, &acpi_gpio->events, node)
>> -		acpi_gpiochip_request_irq(acpi_gpio, event);
>> +		acpi_gpiochip_request_irq(acpi_gpio, event, obj);
>> +
>> +	if (obj)
>> +		ACPI_FREE(obj);
>>   }
>>  =20
>>   static enum gpiod_flags
>> --=20
>> 2.39.5
>>
>

