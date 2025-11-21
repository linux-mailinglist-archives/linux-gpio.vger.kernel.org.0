Return-Path: <linux-gpio+bounces-28975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868FC7B95D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 20:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5FFDB35A524
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 19:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283FE304964;
	Fri, 21 Nov 2025 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="x53Yz4jr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.m-u.xyz (mail.m-u.xyz [213.95.149.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4123043CF
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 19:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.149.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754438; cv=none; b=rUMHLYFMg+pyZIjc37hFcJotvksXjXBRrA6q5V30tKk9uPQVsVH8EBIdqFRDj6Lgy9dT9kjqMp6IO4uD2oB44w1eYwHjDZQf6rR36d8BQlIAj5KV2EUIzLc+fpFvgMH/xPh8PczeqrkFDGXqjYQc5e/tF7vIgvwAe/UaVvTb9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754438; c=relaxed/simple;
	bh=sRpudvXxUF2dVDxhJTtIFHH45v/ini91Pv5akVqeYls=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=p8ZVLG3yHvg3IF3OJh8g7zt+jIj7WVFm6ee/97IRoW7WAanL221EPYU419LueitooVNDIraD4X2s3zTNVVPuCsTpjME+97fo7aSNM0Rx1HgnJ0v4EzYBuM8NhdbINKIGb0f2aNQY91gTde2P7WQmdjMmqRS//Q1awmr1L71IcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=urlichs.de; spf=pass smtp.mailfrom=urlichs.de; dkim=pass (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b=x53Yz4jr; arc=none smtp.client-ip=213.95.149.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=urlichs.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=urlichs.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de;
	s=20160512; h=From:Date:Message-ID;
	bh=sRpudvXxUF2dVDxhJTtIFHH45v/ini91Pv5akVqeYls=; b=x53Yz4jr37J9RgrechGhvktNgf
	3p0feQ+o2+/ILYY3q132fAnIESronpHzbvNtv/psk15GxmxYEvQ6Ss9EKdkLMgF/KvuArurlxpH0L
	qTnnHKpAgyWiaH4KLrYmUSmsdXxbKcAQTy7frxvHFSoN5wpr1/LQV6CTZ8sLgcsS/9KsJojppNwxf
	owSeFfZgu1uZrltPloNt+ZZ1gM8LF97ullzVsUSuAoV12Yp0UlQzm4gYGiHjNfs5IvCNkpfkDHDCc
	zxL5jwbjP8RdwI5Foso13X21LVQroqGhgFszW23BjyDW5SZXNSHNIctVyOWAQVpbdPgH45UnpUZv9
	Cbe3F8VVGW+tq69PGeozD2BoSyzeQlUN7GVKzOrvD0eYeST32UI7017Q/HSEm8ujPGJ9tsRmSKCVy
	NutsLLyPeL+QSMjZ2iYtMnGDRkVR47E3poBsqbA8TiyBqbIWOqsH1BxLCAvlFCQDYrTxofw6JVA4P
	DiYcojuYq9eS6Xk3yiBQfL8pfgTxK34ucQJodw3IHignYby4Ulrg36LU+T395D+GVjPHqgE5NjB2f
	YL/ag7Ae12nXT5W1kWaAiBsb6a5TpFq98DpoXyM8C4y9rmyRGg5ZBqtXCzQD66noahjoiuVwLRhSC
	04x22SSpM4mmrzu1+QmzKWWl60VUl3puDI/BV5/1Y=;
Received: from asi.s.smurf.noris.de ([2001:780:107:200::a])
	by vm-mail with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <matthias@urlichs.de>)
	id 1vMWMd-00000000AuU-3Md1
	for linux-gpio@vger.kernel.org;
	Fri, 21 Nov 2025 20:00:12 +0100
Message-ID: <fa30998c-db6e-4ff3-b327-d8b6270979fa@urlichs.de>
Date: Fri, 21 Nov 2025 19:59:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-gpio@vger.kernel.org
From: Matthias Urlichs <matthias@urlichs.de>
Subject: Open-collector GPIO usage question
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ikk1urOM5SNRDLQ8D0ZJa4JR"
X-Smurf-Spam-Score: -1.0 (-)
X-Smurf-Whitelist: +relay_from_hosts

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ikk1urOM5SNRDLQ8D0ZJa4JR
Content-Type: multipart/mixed; boundary="------------d0k7Uchio9mhXjFcdJhG0wzw";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: linux-gpio@vger.kernel.org
Message-ID: <fa30998c-db6e-4ff3-b327-d8b6270979fa@urlichs.de>
Subject: Open-collector GPIO usage question

--------------d0k7Uchio9mhXjFcdJhG0wzw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnNvIEkgd2FudCB0byBlZmZpY2llbnRseSBpbXBsZW1lbnQgYSBiaXQtYmFuZy1p
c2ggcHJvdG9jb2wsIG1lYW5pbmcgSSdkIA0KbGlrZSB0byB1c2UgZXZlbnRzIGluc3RlYWQg
b2YgYnVzeS1sb29waW5nLg0KDQpUaGUgaGFyZHdhcmUgdXNlcyBvcGVuLWNvbGxlY3RvciB3
aXJpbmcuDQoNClRoaXMgZG9lc24ndCBzZWVtIHBvc3NpYmxlIHdpdGggTGludXggR1BJTy4N
Cg0KSSBjYW5ub3Qgc2V0IGlucHV0IGFuZCBvdXRwdXQgZmxhZ3MgYXQgdGhlIHNhbWUgdGlt
ZS4gR2V0dGluZyBldmVudHMgDQpyZXF1aXJlcyB0aGUgaW5wdXQgZmxhZyB3aGlsZSB0aGUg
b3Blbi1kcmFpbiBvdXRwdXQgZmxhZyByZXF1aXJlcywgd2VsbCwgDQpvdXRwdXQuIE93Y2gu
DQoNCkFGQUlDUyBhbGwgb2YgdGhpcyBpcyBlbmZvcmNlZCBieSANCmRyaXZlcnMvZ3Bpby9n
cGlvbGliLWNkZXYuYzo6Z3Bpb192Ml9saW5lX2ZsYWdzX3ZhbGlkYXRlKCksIHNvIG5vdCBn
cGlvIA0KZHJpdmVyIHNwZWNpZmljLg0KDQpBcyBzb21lIGhhcmR3YXJlIHNlZW1zIGNhcGFi
bGUgZW5vdWdoIHRvIHRyaWdnZXIgYW4gaW50ZXJydXB0IG9uIHJhdyANCnBvcnQgbGV2ZWxz
IGV2ZW4gaWYgY29uZmlndXJlZCBmb3IgIm91dHB1dCIsIHRoaXMgc2VlbXMgb3Zlcmx5IA0K
cmVzdHJpY3RpdmUg4oCmIGFsc28sIEkgaGFwcGVuIHRvIG5vdCBoYXZlIGVub3VnaCBHUElP
IHBvcnRzIHRvIHVzZSB0d28gDQpwZXIgd2lyZS4NCg0KVGhvdWdodHM/DQoNCi0tIA0KLS0g
cmVnYXJkcw0KLS0gDQotLSBNYXR0aGlhcyBVcmxpY2hzDQoNCg==

--------------d0k7Uchio9mhXjFcdJhG0wzw--

--------------Ikk1urOM5SNRDLQ8D0ZJa4JR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEr9eXgvO67AILKKGfcs+OXiW0wpMFAmkgtqMFAwAAAAAACgkQcs+OXiW0wpOb
3A//UPhUhPcXDQacbNfhqld+Ph4l2K8dYpz7YKyHuOKKIfT7zWm+3nmkguq5TTwQFt+6sCAlNJRo
rx9rZ/LWlJYMvfIzpfBtg8YHGf91c40vK/9v3pPlzNmwo/rYx+AxFpy/7VDc8wqqKHDwGz3crA24
ya+ANYm75pb9JOpkr0NtZLkAACp/vVHCooz1L244CW3a6kJKkCsd8xcnxWlG/3VKH6ECGpLr1ig5
/lrw5dVV4HIib0vyFlu0XzJSL1HRPi9Z9qUyWt2vbNJ5Gz1IUoPUnaFYK2xzXneuoxnc7vGWD2L1
YJxIhurxtfYot4/xGf3fU24eFas10h0jSt0uBcucuK41TEW/YSmuqE1QQHbjCF3iQ8jxrI2IG1F9
hOH0a0nos6lSHuqtMLjkS6y9T0sWVzOo9ABtNTXBDajhXYTgMIKf5eyS4qmGX7lObVZZ7a63vFEq
ARhEY5ii5PHxtDdkvjmqBK0Ka+yAMNAE981mHrJ5w582v7Ot+zOXf1a8BXvjI6d0a41zOmcKQV2F
D9NbPWEon+XqbuFlVCS/Qi3usGslfevuU430LEi+M/4aZQRdl8ZVllXFN1R+15VjTUPRFAxIw3ZM
BWjanmAY0GYH2/YGPU6h5o3x9594dUmJNsPWWJ+kZT+EMyB+uLAWtJUXZJTKjyJ+Tbl0oCyRGRZz
BvE=
=1DAt
-----END PGP SIGNATURE-----

--------------Ikk1urOM5SNRDLQ8D0ZJa4JR--

