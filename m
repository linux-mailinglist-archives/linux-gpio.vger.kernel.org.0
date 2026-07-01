Return-Path: <linux-gpio+bounces-39284-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EIHSKK7QRGpE1QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39284-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:32:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6FE6EB213
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:32:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JPmzfIvb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39284-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39284-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FC083043822
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6D93E716F;
	Wed,  1 Jul 2026 08:32:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462D3BB675
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:32:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894749; cv=none; b=n++D9m2O/y66/MSMSZg51HZxaGx8SnMO0pmN/72jhyo1PSDIajP5YguNlGO5+ZYOX5R6mxTIAyUbl9SgH7c2SiFR20GoY5D2l/8w0ho3ZYG6mLSR4zLWBcWXa4vhf23F3GapoXtfq16onxIfbZfoKHJ9UCYfLXc37Gt5lVV1BV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894749; c=relaxed/simple;
	bh=ZKl6w321q3N/LHsPju0BkShQH/Evbm1Q13JQ+0LryA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiM59rWgBrVkpXpUwB/0JVTvhzaPt4opOIDQhcaFZIhtJBObO7to7S3zv/jKLgtSd6FzyJGU473bNU0o8bKq01ma5iOKGLMhQo6xgnbtUyrjUxiM6b/+GlehiSGgtZhuqFwOB3YslQLNRSHRZv2Rm53J1Qrbp4s0xvYBpgJ3qNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JPmzfIvb; arc=none smtp.client-ip=209.85.218.53
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c125bce2294so50260866b.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782894747; x=1783499547; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZKl6w321q3N/LHsPju0BkShQH/Evbm1Q13JQ+0LryA4=;
        b=JPmzfIvbVlwkz1LVtR+zY+Dq0mbllClQSfXvYCU+lX8XnPXQWKFgfWNNUIixs9M11F
         qBnEHy3IlVBURHWqeQhJprWAYSScAFy0lDPjbRp6Caejx/5sD+E/c6k1cYgF8jQyWjzd
         JMPl5gbKb5JqAC7bz3zfVeTo7HUJRcjuqq2kPY65PkLpWqlsYZzq3xH2ha2mFC24MkJW
         Q/2UDtJt3hERYCTr3R56ovADgd/N8YBgZzjo8rM5+QOEy6jgrCxOWnVAAVr4xSyREQ5v
         GcjAddI9A7sTtjlhLRKjsyKkNDl+AmO6KZIf+n3ZLRGgdlRjw15yq3ESGtcGQZ3MvHdN
         NRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894747; x=1783499547;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKl6w321q3N/LHsPju0BkShQH/Evbm1Q13JQ+0LryA4=;
        b=IvvVuYDlgwfpaaVzzUTf3V/sAOKy8IMhBre+3AkKL27yfPCn2vL17N6lqjiz703Uxm
         f3LLfuVtRUOl1mImRk5vIixz0fSyxGrPJPjd9JXvYNrHIqU9kdThXcqndzKKDtihsHcx
         sgF7Ol/DqiqtlZeq7pwOB7/jqOsE1aiGzA+IxRnM6K7IWvQEu1TMFUW9QesbD8wjhSrM
         ZbNArBHTbucQbuAiFVT1Td9DbqAsGMYw+VISZ5lwDjMqoipH8LTnFYYcLKxI7XNPcXjZ
         t79djbQdSYkCJJYYsgAtwVKcf9nv3NhKAoUFFuSqvbLEbC5kOWC74r/ywfGVYzA9uvqY
         mo8w==
X-Forwarded-Encrypted: i=1; AHgh+Rqn/CL47gxji8Se3LMqeGSHhkmjg9viO+LsKXGtQDEKpU7xO7Yxu660m15pNUlHOMZx5+UGsIPpDhOc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/c/LEhPy/M6UYBMQrWWDfMI0Zl+1SkuMcChSUsA6eJzUVUxxC
	lDNcERghFVLYobpb4cmHYSh/n3kfPOt4SDJGeRDjO60JBq4oA/vG8LLlhTM0IkbW+Sw=
X-Gm-Gg: AfdE7cmGfGDIGeZCb4JG8QmRoAwq+c3ePPFf5RtYm3g8g4lt/ut/sDCMPHA+5RI2ObM
	wCVQldN/tm9Vk88t1Ilth+Fs/+eJtaYth1wGegGiYZnG5ltT4phQzScy/4CZaV2EPOoCG2Acf1K
	jQR9bX1KyDfHa0Ja5wlodtwOFTYNjufABT1RBZY1gLZS7q4uuSfFB/HNzDRJw63bDA/ncITxurv
	jPUUF20BMZZOXor+TmT0OIUQuLCGTlir6byLgu1/SXKe7okt/eaSwHOhuIJnAtptQJv3x018uxi
	BwWiIaAcGbA3KouPgirvns/cRZHklcknl/2ifh1ch8LOgs4ZOygI4vOvD1DsY5c0LSlS3Av7zbn
	txeaZcHkW7cC26J4wThAwh45UEA0z76mMrW3Ggt+XCGuq5o3H3XP7cW1eznqNrRWbMFzgzBd/Az
	ws+6BELNemE/HJWs9FFjhA+jkxrsLFU0aHsf+UK+S9DlPMWwTXvs3t4iiQHmTyKGAxyz0MrWUt0
	DGtVOiyscZyl64o4KrlNETdd51YBp/eEGiryEkebPM=
X-Received: by 2002:a17:907:3c95:b0:c0c:9f16:90df with SMTP id a640c23a62f3a-c12a9d3046fmr30320666b.13.1782894746816;
        Wed, 01 Jul 2026 01:32:26 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289142a46sm234310466b.53.2026.07.01.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 01:32:26 -0700 (PDT)
Message-ID: <e487f14c-0329-46b1-b087-188adea36950@suse.com>
Date: Wed, 1 Jul 2026 10:32:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/32] drivers/gpio: Stop using 32-bit MSR interfaces
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>
References: <20260629060526.3638272-1-jgross@suse.com>
 <20260629060526.3638272-25-jgross@suse.com>
 <CAD++jL=D81BED5g36JRZ-+-rYwszsMmUhi1vLeby0KZVjbr00Q@mail.gmail.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAD++jL=D81BED5g36JRZ-+-rYwszsMmUhi1vLeby0KZVjbr00Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z8GiUPE2jbuzLZaCy02SW6kJ"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39284-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E6FE6EB213

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z8GiUPE2jbuzLZaCy02SW6kJ
Content-Type: multipart/mixed; boundary="------------7R2Mfy70R2uAdOLBmt7KmUSR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>
Message-ID: <e487f14c-0329-46b1-b087-188adea36950@suse.com>
Subject: Re: [PATCH 24/32] drivers/gpio: Stop using 32-bit MSR interfaces
References: <20260629060526.3638272-1-jgross@suse.com>
 <20260629060526.3638272-25-jgross@suse.com>
 <CAD++jL=D81BED5g36JRZ-+-rYwszsMmUhi1vLeby0KZVjbr00Q@mail.gmail.com>
In-Reply-To: <CAD++jL=D81BED5g36JRZ-+-rYwszsMmUhi1vLeby0KZVjbr00Q@mail.gmail.com>

--------------7R2Mfy70R2uAdOLBmt7KmUSR
Content-Type: multipart/mixed; boundary="------------APXQrlgkGVWay0uXfKDY1Dbn"

--------------APXQrlgkGVWay0uXfKDY1Dbn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDcuMjYgMTA6MTMsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+IEhpIErDvHJnZW4s
DQo+IA0KPiBPbiBNb24sIEp1biAyOSwgMjAyNiBhdCA4OjA34oCvQU0gSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+PiBUaGUgMzItYml0IE1TUiBpbnRl
cmZhY2VzIHJkbXNyKCkgYW5kIHdybXNyKCkgYXJlIHBsYW5uZWQgdG8gYmUNCj4+IHJlbW92
ZWQuIFVzZSB0aGUgcmVsYXRlZCA2NC1iaXQgdmFyaWFudHMgaW5zdGVhZC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBJ
cyB0aGlzIHNvbWV0aGluZyB0aGUgc3Vic3lzdGVtIG1haW50YWluZXJhIGFyZSBzdXBwb3Nl
ZCB0byBhcHBseQ0KPiBkaXJlY3RseSBvbiBhIHBlci1zdWJzeXN0ZW0gYmFzaXM/IEkgd2Fz
IHVuZGVyIHRoYXQgaW1wcmVzc2lvbi4NCg0KWWVzLCBwbGVhc2UgZG8gc28uDQoNCg0KSnVl
cmdlbg0K
--------------APXQrlgkGVWay0uXfKDY1Dbn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------APXQrlgkGVWay0uXfKDY1Dbn--

--------------7R2Mfy70R2uAdOLBmt7KmUSR--

--------------Z8GiUPE2jbuzLZaCy02SW6kJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpE0JoFAwAAAAAACgkQsN6d1ii/Ey8t
ZAf9HPRySazaSywuYFzONl4XXphp0o5u4sc6TWRUGGxOspoyGyDiEFryrKMuSvPk65s6IuUShkCn
f/ddi85xz5C+FlC+nn4KeqAO9b54PfFtBi5sYSwDhPzDpSc0KvWI3hM6/LUbSzcbBBuST5ICzKjw
Z7pCWh7eVFBqoCknFaKoADBOPmwZeRcuegGvhpqaFY2UlTgCdKY+FJrIzp32hPDyAFrf6bOUoVM2
aZfKzOzz16ZZ90KiOfci0jTcED1R/oxhNnRX4ofk+oFza09VXdkWqgUDm9EdmAhUPGRJdT2pVTos
uIBN5ADCV6M3saecKRlkb5rtDZxlDk+DfY6/m/kpPQ==
=lPFI
-----END PGP SIGNATURE-----

--------------Z8GiUPE2jbuzLZaCy02SW6kJ--

