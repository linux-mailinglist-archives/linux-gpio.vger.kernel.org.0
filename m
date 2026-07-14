Return-Path: <linux-gpio+bounces-40072-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2HWBFuxjVmqY4gAAu9opvQ
	(envelope-from <linux-gpio+bounces-40072-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:29:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A17756EEF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:29:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=rMSEbjsG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40072-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40072-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BED08301FABE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02313446840;
	Tue, 14 Jul 2026 16:29:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7A35AC00;
	Tue, 14 Jul 2026 16:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046569; cv=none; b=Sa2WPJr5oyAoIpEIY00LkW244lcEmhvd0n23hiZv6wu/vevbvnms8chq0tIBv4jNDnCmw/Hd94Ofeb8rRpvXlXzO7Bk9DstA0bY9HdaM8ZQUVPtgvL9mYLc4ylQOVHsQ33HRH21dr2b8l6TneIMdx8qZTlrTwEl2pUKwbgWvLDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046569; c=relaxed/simple;
	bh=RB6Y7NCgzzq9lt66L7r4rjxD+V2JwMb64XystWuntxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esqkkZd6Pwflo4fmBQoh8Gq58LwzJzcQx4p45vCqaFZqGlypDatPfZVmMn7h/ONKLBD+RtjLbo7jUUSz1XB7aM/bV5kt9aG2P4f2Gt8lcqB/3C5DNO0ldjW7eRNaBCKMf0dj+1oFGWeDDFj+OqsAigO0vkTvfBzTAlTKQ/EJyPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=rMSEbjsG; arc=none smtp.client-ip=212.227.17.22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784046565; x=1784651365;
	i=markus.stockhausen@gmx.de;
	bh=clEBGzefgYjcGWBcJHxkra7/GhG3CV21HpTe3IAaqrA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rMSEbjsGlNthmlLadvtB7yfFx8HzKeyPg6nZyesD9nZmVhBe0Po38d3Mt+sQ+luL
	 1Y2wcLQxCEUWp/xDgTJ4OHAdIpo5griqxSVfZHkqpK0ZLFcKoNtGqwNF+YJF3uRPL
	 xm+5oorI8NB+8YRBgiOK9z6uN6kREIZoQQKd4bUPw9YG01XjP4/6/TBO8CnC7qun8
	 A+YzHgccejsC+0VIvq0kitrd8ubAvCBY8O+HhkSBpylq3IyHa8gVjLNsWNac45p6O
	 1E8vlhsNcxWnzwc4DuLiAjuYNQfWLMpmBKVEVBPhjBEJtIV9cjLzthlUIC6a3CPxt
	 dh1/0bD/ZeuiOwLdjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Z5-1wwgOE2t07-00zXVg; Tue, 14
 Jul 2026 18:29:25 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v7 1/2] i2c: algo: bit: Allow to skip bit test
Date: Tue, 14 Jul 2026 18:29:14 +0200
Message-ID: <20260714162915.3018703-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
References: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:igDmAAbafKVtH7gUDzQ9b2qCXyJ4BbR2r5r9010sDeW2CrQ2LJp
 CRr2rrIhiTVD4c9cq0DuKOVpLwE4UDdNt1DLlfxXBeqmL8qRxo6npCDR/r04cZKcqLqMt0o
 gBpmLAfC/EY/ECHPfQmKPO/33P0zUspU/S+whE1Q90juSUhPah3Sazlv8yLJRtL6yuf2+bE
 zuxPtVDR+TkhvUmWp6c2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kTXc73iMF5I=;yY2OwFUJ3QJiDnuBxYiJ2DszDSa
 ujD9zYTNot4lcb/h8794CpbhU+42jWLtshBaML7BQxS+HcoogM/bcWS1UIe/vobo7NzUXQOJ5
 SsSX20Ox5MAJe4n+ivpISb4ifISQ1dMcwnIuJUfvUD29lwP6rKKIgqIC7RhiCmhuSV252OtEf
 +z+IGLUcushza54ELB8CfN8/slfUKqoIbxSXQMg1Ov76JP7pl03dkmDII5ZsdYcEf4zTO6Bds
 s2JrmE05PBjMr/X2UgRTPztrC+qT3PK+n9wf1+xtBMUh5MCOj3b7zaBlQ4VPADwj9vu/NLvae
 wUNmLYURa52PPtxCClVgJWQVwb3VJZmtaq9tqMjYY06yXwOlZNJvx4swlFN7lNH16/YJ0Rwfj
 6rWGGHSctKuKKpMDMZv4yM0SLg64FylETRJLfhEE+N4qux8OIa4DYmFALwbTYnkj2T1JFNVb+
 A0c9kLdCJ6pIhWhMHDNQhe11RabN4wuNxifrC94DDyCL92ogrEtprDnq3C6j2BKVGW32qZwAj
 lYxcwY91s+RdRizXU1tXM8yxWwKUaR2A3RYJ+TgIIR1DZWFSBSViLDsR6r0K/8z7l37u5WI9v
 8Xi2hlg6/MgewaTlvMHKgDn2zp2WwY10Xg1eO8Tg+ba08OEgeG3HGfKzcnCr9VDXasRYH1PE1
 6MFjLvY4P64tNsygJ/OqWizkvjgR2IzXXdiUs5SuN0jOMirMlVTorH2lV9bmeNxzv0oylkFMg
 Qs9otEkR+9PQJqZnnXd9IEnErenmOb0vgvpfI2b/CMFo+frics87qG56113lcK5j6gVlLQ420
 EUEzDI5rUSU5Gl6+LEvMVr2IjehZLUIhc4biYoSTZQf2/vRaMmEPGg7SUjNhbT6A9MO52Ao9E
 bxEA9LN6NPyVlGJpkK8tdl5nJ2wudk/Yysg9IWDZdMjLToCpzBIDOcnq68OpAT2H70eRmECfB
 rJO2c2BVe6QxvzoSkDMKJHZ9/BjTJal5pGrYOWZb/G3w2RcbqMhQTBQjOALClo5LycqXv5wOj
 CJqICudmUx9V4ds5+k3/bGCOkKsxYLs3OEWVIwsVqDqr8DD91uraPMnweyKraQpoeX+3kYz9T
 hWYIreS3SUASHK3KfOh7RIxnoOTdhFqUHQx+0LVmfw9rQEQSU8J/kUfsKh3KZcPwmc7AOtGYL
 qah+NKaM6M1UgG8ZX+Gc2zcsgvamZ13hoWuaXcHkuZc/cKZyG0rZatBPzOcxARUlAAS8eJq32
 AohW09+ltlBmJPYBRMhaI70awKIJORHsE74OCAOnXMJup+aDDoGtb06OkSxRcMbZzV/p1GU+C
 5gZc62dn5BaWkKT6jovPDQXjLTQNIewucUCHdCOWeyPZXEuimziW8jQFzaWNWYQaUJpEX64ae
 jvm6yOsnhxFO20MWpd+2YJUgsqMIz2Et3CZs5jFpL8rOJ+c4YnSAI5bSUQit7LepbfuAzboZS
 /ZH7A6AiqfJzIa366Yti2y7w6cIUIYlaj0k+GpPQ6G5PkRfWkP868ZkO3TXvwveGF1OYEqRON
 BWCivCjc7It5aouyKq5YWDZDUvN109eDjKJGUGCVRXnuRBIIIj3ROpyJxFSOZdAGzlMf8k2xW
 nIIH5IEvAFDPgU8B23Ppdy1zShuYlwzt+fifG5QmgR5Bz1D+HRWs+VlrjNx+StB3d0ixnzEUP
 WK2EB68ym7KXpQL3GTfw9UoKk6W654bKpozLsNFG1WZEj21Ngcjrt8OH4phXUGLwpuXhjaPxL
 MR9QWREm7g7yT99m+Eqj0BFaF8qSdHZS7IlQQAOlRhpBq80pMhO+jqTRJC8adQYJHaHdskTgv
 nNAS1HCocISO+YPa+Iye6/Mk6xQfxka7PBa9QKxOO9BMioaULV080X+vuWlEefJgfVXDVJq6g
 wbmHqmeYaCPYnmSlCOv1M55p0r3Dp9PPZNoLQy6McqQSznwAGa9UrgTN10YrKI5KREoF3hkYz
 YAzWRtltAO/mj5Joz4zcgaZRxOgzYrn+FKI0jnldvu7DQdLNBHityNm7oizcRWrUtvdtDtv7m
 lGK5OnoJv53lRU5SfxxQz311MPIth7iixOax5M16tM/eZkPkvNZe+E9wHWEol91hTYvhDJwpn
 4Iz2suV+F3ga2UtLEvGZtSldmsi1Jyl8l6v/2HMymNY3EDtUJtHX+pzGujuI10dDKZc6IUR0E
 dyP9ICdIWY4lSxOvL3M6T5BGRp000RXNkYavmHkJ+RcQblU1TZOm/nvIjjMF6wUpcD4K5TZqK
 KW/+3iyoAc/BREGSnoevddUGe4pfbx1jQ1NoNzya8Yvfi3c830yGQ0umPMIzzRGnZTkOd3hjz
 G3piuJME9N+4ZGbSGeVdREHV9inLquoBXHrlwKEfUscLRNV0BObrQ4s6xtwZRRhEDd5psN2Np
 bpjkR7gmyjf7yEm4EG2mFN4KF8AWjRrE0ubf6HwYe1m6ogB2/T1hfRXKNoy5IcSGvoq+uPV+E
 W/fGm2XmlRwQyXzVkQnbgUj9H8v8gUCqXjurTxJNeBqUfhKjGKiClc74xKuoPdZwjIzfpBE7K
 ZCDmLmsuWcXOMC4PdrSbL7LVRdpMKUQen7SuF3MxcefFjRo41YRpmbd451FuLvSTR2oPNkOmx
 3hb9/K/lcV8xHWroczLEmTc7lYH4AnZFRqaomEsrM6RmCXICut2Xq7BXoDOrwAyxDKk/5L9dW
 lRIMObLcTZZ+4VCDi/ye518M+udDbzSlxPLZF2GXpGC08KrWIJ6wIFkzawh2aCp2prsnHOwJV
 SaHwyLTuej345TGZMOzOwoy/m6PF0/Tz0pg4gCPEp7AXhSiPlO6xcYSkAvKhluFxm1iApLPr/
 W4CqAwCXFepyYNXT7I45P47cd/dIPLqCXB7y3rLZts5h8OjPUq9/fa8nM9TtmUN4GtCFMjUQV
 kwX/7guS3ksTJ9SrCa1pHi+0VzszyX8MNl81qW3SC9IcgYi3sS/C1vVuDoyOh8SGQooL1X3uk
 bxD16Y+egm8wT3MqkPlRHu39uMQNAakdqGwzpHRGhahwvdYqf52l+BjL02kZa0NtXPCCBX0B1
 ava9Wz5urqWY7agkkHwQf0reaQVGqGhleeIBoh3n1P31tf0d2hSrVdBMioYGM4bL4K6v5Nq1I
 qBquzk3uulUORuo9QgiM7aBkr1F+YqM2A9wniVKlmI3X7uW7c0I2XWJitq0vPw3KB7xC4kL6k
 IWjlJiRi1kxpxX98izn1T9F4nAoYc5KYXQOjAP+n8Dke2ikSMyQ8miUUpCsvchyGsQOjSmTAo
 Q7YNi34lcK0VMx8vj3LHAqECFSj/8Cnx4MPe5PPlaRwewq9r/Q06jXRd/WLEiVYiuBNUgbN0o
 4vVvLrumRVw7u9B+zS50Yz3Mm2hKMy/bcQfecu2UNq+gnyYbmibUj/HU2he/tYt6NMZyrsskm
 9DJ8A8wdu8S8PMxs0Jss8gMG6Ig2VGVsPfSbUv2TzUIYp3hcG5BzAVRN056kEi75LFpLoBgXF
 7hlPNT/rXe6VO8eXpTTmZteDSo9KG1A0KdyWvyXCBK19E7rKkLMHgE2GrQqYozIEWF9PIbUJ+
 hPxK4JI1doIHQVMh7Fl23m35bI7iwc03nvr/OTUa1EqM3gBkK3Qrgzo6UrVjE2ISOMzzFsMaJ
 aLy0WIdjHRBQ6bA6nUSWh1kqMSMAs5n+uC75Nx6kik7DabpkjWPl0L4+wEXRj9eoW4iRU4DcY
 4o8om1HArIGVEHZ9hLuf76HXQJiwdi57BbOaKVTuOeJ5FHCc6Pnx/iRJB0Yni0aTUaTyoKlM6
 qw+rcu2Zb9w/SWtBu/J9Dfd64n7zWRTSu3ulDK4cVHbs1AMDFtjeAg9ZqM8udqdOtZj69w784
 d0O6fOydWfcN9pIS8yCKgy/LEY5lSlgd1HQycv1xvMOAW88z9hTXK9zK6kn0+ZR6E5GGDQfcC
 kyM5bCGsnVghj5iiacLhCVSLr3NRbgwV+9dK+bv+otsZlB6EvSr2SHMHbvYHXYtQcWD89zHHO
 R3K6/lCsv1rNZlID+vERIoy+Cok8c6TRanrbkJYzgB3oSUrw2PdDTcnlTb+lYZPer6MCma4It
 47dR+aZY3On8jlUdgA48dxAaf8ZWMY8tYJn7vHjCfHdtCQ4k3W5JWswjWN85utTAIRnjnEXvx
 qoGlT9gpAw7eA1/cw0RyPvd2P8n29A4Va/3AEZDZ7Lp6wWDOV3IKcPy2cqMjW8ZfBChXd7DTN
 3mODSoZG/tdddE0G/oZ/hxcIlSstJzWRLFVx3Tip8Wak8zksVB97xa+YS6r5aS7MxhdJs5K1y
 KC6fRd9jHY3bK4CyJL3mDyogXVliUmuLuzlpayljGqKw9Zn4uT2Pp/XQeeRIAsQj6dxOAfQVr
 qPNEWJRFV8RE+p0iN/4a9T6EEFxDWGJn2hYJaI7LwkUL6/Vrk3mu+jD6zWFVQMxqPiciX0kZ3
 OHnoCJKN6bTCTEdwOo5h7s7l49GsQ3x9ioLtF4OvJqIo4iZ1+Dgly8ljwi4jJ7z90zl8inO1C
 4etTEOPiPqK3iW3y8S/g6G57rXDHQqYGw5bM65P11Cfx3x7ZH3nmkFIC82L1jKHrMwWI218kv
 wGJ6NlUJNCEpRcqszNkn8+09yJ9KMW461qomrRJ9/vXqeoOQxDw5w6uIzMERXVaGjzIkLGk5G
 HQlpdFIDu1BmbO7RjYk5A632KTot24ycmoR9qEYi4UXOsuQDcXQH0VpuDJrV9ev2BUWqUm1O0
 qBreE6Qe3oZbKauhfdQMFT/ygb+br7Vo65gHv0Tt3rQlIxwIprHIaAtzpI4Ciu5BFTsVws60P
 JYPZ0V/YdGJx08MlilmxEc/eqNYa1ECVR8iaN7Z5vad3oYHHAs2yd+uRj//5JsyfbOB06QHSU
 pwn/sCYgPFR52fQ7d0Ds3jRNN6ICowZsw5j/tDNVFQuCdqyIUDK5kT4E8ruWqH0bGvMpj0J0J
 yK5JjIxqQTzh0M1dndWKKcDgpSBI2uiK5xtdZm+UB/iYY/Tnr2zllKz+ckSWXjYIccdmnehE8
 O7crlHDKs8/yChEhVUCwEaBoGwBsS29v5YUMpiPi7v3KLudvQPisXlO6t9/u6N9JFs/wy12HB
 oEweo55oXNXrWziu0dDoD9MW4CLE+w/7O6dktfRe36jjURZ+MVavfs4HNPcq/rKEvRIa0lVo0
 64Ytp2WlPsrHRBPExAmjIrEPWxJIC+0WlDBN1CPAPaVCQnFoTDUAmdDLClKhVP7NLw/2uVbJQ
 pKotKXY++6o1EkS0MMTEcFJWO3P7iutyjbWTdUFpmJ5SldUoQJj4T/VYFtQzugcKOkKE0o7Cd
 GcwNWapnd6I4gBAF0NoN4sJQ4gsq5dfP8UjvpL94abdRO3XYBLlvmlaPVY8l9oWzbqFbBEXcj
 eocMKZCtQpN88oKul11x4x/qfuCsyHqdGlkAoUvzkPC9xfpaW2ZvrS1IVt2sX1PpdDRrecLEI
 Ib/2IBU5Uiqw/lbEqolbiUbQAL4CoGSSWffJS6b/NLrBToRAPnvkh19JboM1c92oSbGIPnPYA
 wkoEExOBly2FYn6zBOc71mxFhG5v/jgVitVppn2HTffZfZEdhOmRtMMr70/wpmwmZ5C+nIL7j
 uTuDJKE3Oiuybl63qlDzyTzuGJ/6PB7gnfk2NMiuxyHEz35LeKILSy6D77g3urgjQg5vXHkJ8
 LJOm6WrZLO9T2q12XPzkmeXFqYJ7L/BsQB1kSIjhnRGF5CwBVpHxgm5Onl3gUS5QmIMuVwJCo
 V7hpxYDHS5gKLZpt0jYsB2LXCx67zfBbeZJbPSM+ZmffHASIR66d8ZLPPW/NyzuYM8RMiq95y
 0GKlobNdNN3dnfJio2x2hB11dUEZcqCU2ouwmmkbVhQ==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-40072-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:markus.stockhausen@gmx.de,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gmx.de:from_mime,gmx.de:mid,gmx.de:email,gmx.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1A17756EEF

An I2C bus can make use of shared resources. E.g. two GPIO based buses
that share a single SCL line. To synchronize access to the bus the driver
might use locking with the help of i2c_lock_operations(). While this
works for normal transfers it is not available during initialization.

Especially if i2c-algo-bit module is loaded with parameter bit_test
it will issue some basic sanity checks that will access the bus without
locking. This might interfere badly with concurrent transfers. Even
if these are well synchronized via locks.

Allow the consumer of an algorithm to override if the bit_test is allowed
or not. For this add a new boolean attribute named skip_bit_test to
i2c_algo_bit_data. If set the test is not run.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/i2c/algos/i2c-algo-bit.c | 2 +-
 include/linux/i2c-algo-bit.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo=
-bit.c
index d1d9a6c1a1e2..7ca565cbff5b 100644
=2D-- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -639,7 +639,7 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 	struct i2c_algo_bit_data *bit_adap =3D adap->algo_data;
 	int ret;
=20
-	if (bit_test) {
+	if (bit_test && !bit_adap->skip_bit_test) {
 		ret =3D test_bus(adap);
 		if (bit_test >=3D 2 && ret < 0)
 			return -ENODEV;
diff --git a/include/linux/i2c-algo-bit.h b/include/linux/i2c-algo-bit.h
index 7fd5575a368f..c4c43aec1e67 100644
=2D-- a/include/linux/i2c-algo-bit.h
+++ b/include/linux/i2c-algo-bit.h
@@ -34,6 +34,7 @@ struct i2c_algo_bit_data {
 				   maximum 50 us for SMBus */
 	int timeout;		/* in jiffies */
 	bool can_do_atomic;	/* callbacks don't sleep, we can be atomic */
+	bool skip_bit_test;	/* override bit_test module parameter */
 };
=20
 int i2c_bit_add_bus(struct i2c_adapter *);
=2D-=20
2.54.0


