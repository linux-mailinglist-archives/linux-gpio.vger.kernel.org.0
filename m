Return-Path: <linux-gpio+bounces-17928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD1A6E8AF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 04:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A47AE165F0D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 03:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD091A5BA8;
	Tue, 25 Mar 2025 03:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5fUT0tC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC1518FDB2
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 03:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742873012; cv=none; b=mLT1Nbgx9bRiRiPFqkWNApRlWGbU0Viio7C1GGLGIBKG2ieWpJKFdz6CiRVtaltY7VtShQxKedBKYrDBqgc7EXkD9cKQm6Vg4IQPjrEoFf+1NqpgjFdoGOr9KbON0weyeBRTX+QBSMHttp7RLSa45JDyVlc5g2X/vBWpXyIXUZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742873012; c=relaxed/simple;
	bh=y6CPzVlAzBXjxNFgJv2oIdsZq7bP9Vbfx/bs8PcHDmI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=nVqYNOyYNqZnsFXTGQZVjstZavuR6H0uHYhBewGf61Zcs6k96+CuJXnGghWjGXQuCdrASSTpNv2EB4HV/NqFmY8hiMSPJCWo/msRh5FYtMwh37Q5vcGfU5Vy9u7S460SNswHVnQJfDT1w9dFx4jDCdGOQoyIWTAuOHjQC5Dz65A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5fUT0tC; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c54c52d8easo667116285a.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 20:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742873009; x=1743477809; darn=vger.kernel.org;
        h=mime-version:user-agent:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6CPzVlAzBXjxNFgJv2oIdsZq7bP9Vbfx/bs8PcHDmI=;
        b=Q5fUT0tCEBo88ThvAz0gUJW6L7cTEMy65FI15WP6vDlheqiX99ZK56OQlGloap3Xw4
         QP0kMLGXwZ9O1XI1+BykJ/55VsJZluQh5zM/IY21wH0eNzMnbxBtFgOil+KVuOJkhGpb
         5KSZxJDCRbM4hociZYxUrG8f8harcAsIbBgBhFDL/novrl+VF8D7Q9uJc2ht/QH/WixQ
         4DkYC8FN0pe2eo9rYM0K+dTu4fQNkYyv0BqRLxfaPwMZORDZMjlGMP3hJTIHFdMOVfq4
         FU2eaE5BFaBG+r+dO9x8hngQDolFQp8s8Dw65n2AQhPceYa74MNT3z1fpuZZqUfF1BfF
         by5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742873009; x=1743477809;
        h=mime-version:user-agent:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6CPzVlAzBXjxNFgJv2oIdsZq7bP9Vbfx/bs8PcHDmI=;
        b=rcs20IUQQ7BHVNnxE4H5f3mRuhY2thRDU7I45OKUQFJNaj4bb2FMKvJpBgMu4p4Wwh
         De+64oSzgKicmemVPdwLp0Fyr5m6MEWyQ91JwDx3+oneBiDeZuOI1kvARq8YjCuONQuL
         Ge5eHk01TV//mc9Dv+A2ZCCD5nHWnrosE+/X9WjSO2DK+UHtz+C2m7s+uizIw/+YbTi+
         MA+kkGgRz2jxGIM3dI+uBSTfZ6wUXXLDYLq/sLAIqA1PkTCfDZQltK87aB61coxXxa0R
         nbQTGgGyVlt7n28pcOkzpGKChVFYgj/RXKGtaP8524crpZiTIBWnSWwO3ZHO4MhhRp4m
         Ub3w==
X-Gm-Message-State: AOJu0YwaIOBvtknNT7IFZpthIgXDXgiuS7ePuz+4XlvyqOb63rN26DIh
	nE8u6Gk+YCa60EOM3Pfe7HFPmEBr7X2BX8hheumhr2++xed++6jNH1ddAg==
X-Gm-Gg: ASbGncsc3X6MIhvaGFt00i6uV4S8Bmmy4Bmon4OmwHVGLDitPiLnZLZsYzCCnJuwstK
	ikGix3EH+xM+IDzDDl8UUMZQ2WG2pJ/NqoJUaeyUZuKobCRy2O8dpuEE5fsJP6KhTiufScPK7in
	DdssTI1soI+hFbKpmVNqx8iB9veqhbcCpugfgh9q5IRDeICABPhRF1ZOQ4MmDzr4m7SHcXWBvRD
	VCWJKb/BfpRy0v07HzUEU7CXLv8CQjWFa9fbJJ8les8BKarUIXiROEsXPhqn/aHhHiWeQtRCusU
	wJ61t8PFE3orOo1ZyUhhAZLiIrc+yMyUvFSdhxWQYwfXNls7UdW1Ptj3UYs1fPoeJ8HyBA==
X-Google-Smtp-Source: AGHT+IG/ST3lz/XcKmMvswMRyl8IzwZuv5z9v8KGza7a6+NesZwHLgrH05I8T3h05+Vi3t5kAIwSJg==
X-Received: by 2002:a05:620a:1a92:b0:7c5:9452:4a60 with SMTP id af79cd13be357-7c5b9ab6515mr2392596585a.5.1742873009131;
        Mon, 24 Mar 2025 20:23:29 -0700 (PDT)
Received: from [192.168.14.88] ([184.145.243.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b9348223sm586573385a.68.2025.03.24.20.23.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 20:23:28 -0700 (PDT)
Message-ID: <34108b89c6fe4ab05b65a0688a3d3e3742371074.camel@gmail.com>
Subject: Remove useless code in example [libgpiod]
From: Rostyslav Lobov <rostislavlobov.k@gmail.com>
To: linux-gpio@vger.kernel.org
Date: Mon, 24 Mar 2025 23:23:17 -0400
Content-Type: multipart/mixed; boundary="=-GLIjW+jlZDns/0mF8iji"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--=-GLIjW+jlZDns/0mF8iji
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, I noticed that `libgpiod/examples/reconfigure_input_to_output.c`
has some useless declaration `struct gpiod_request_config *req_cfg =3D
NULL;` and later free `gpiod_request_config_free(req_cfg);` of the
variable which is never used...
So I'm attaching a fix patch.
Rostyslav Lobov

--=-GLIjW+jlZDns/0mF8iji
Content-Disposition: attachment; filename="remove_useless.patch"
Content-Type: text/x-patch; name="remove_useless.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2V4YW1wbGVzL3JlY29uZmlndXJlX2lucHV0X3RvX291dHB1dC5jIGIvZXhh
bXBsZXMvcmVjb25maWd1cmVfaW5wdXRfdG9fb3V0cHV0LmMKaW5kZXggNDUxYmIwZS4uNzM0YTk5
YyAxMDA2NDQKLS0tIGEvZXhhbXBsZXMvcmVjb25maWd1cmVfaW5wdXRfdG9fb3V0cHV0LmMKKysr
IGIvZXhhbXBsZXMvcmVjb25maWd1cmVfaW5wdXRfdG9fb3V0cHV0LmMKQEAgLTcxLDcgKzcxLDYg
QEAgc3RhdGljIGludCByZWNvbmZpZ3VyZV9hc19vdXRwdXRfbGluZShzdHJ1Y3QgZ3Bpb2RfbGlu
ZV9yZXF1ZXN0ICpyZXF1ZXN0LAogCQkJCSAgICAgIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJCQkJ
ICAgICAgZW51bSBncGlvZF9saW5lX3ZhbHVlIHZhbHVlKQogewotCXN0cnVjdCBncGlvZF9yZXF1
ZXN0X2NvbmZpZyAqcmVxX2NmZyA9IE5VTEw7CiAJc3RydWN0IGdwaW9kX2xpbmVfc2V0dGluZ3Mg
KnNldHRpbmdzOwogCXN0cnVjdCBncGlvZF9saW5lX2NvbmZpZyAqbGluZV9jZmc7CiAJaW50IHJl
dCA9IC0xOwpAQCAtOTUsOCArOTQsNiBAQCBzdGF0aWMgaW50IHJlY29uZmlndXJlX2FzX291dHB1
dF9saW5lKHN0cnVjdCBncGlvZF9saW5lX3JlcXVlc3QgKnJlcXVlc3QsCiAKIAlyZXQgPSBncGlv
ZF9saW5lX3JlcXVlc3RfcmVjb25maWd1cmVfbGluZXMocmVxdWVzdCwgbGluZV9jZmcpOwogCi0J
Z3Bpb2RfcmVxdWVzdF9jb25maWdfZnJlZShyZXFfY2ZnKTsKLQogZnJlZV9saW5lX2NvbmZpZzoK
IAlncGlvZF9saW5lX2NvbmZpZ19mcmVlKGxpbmVfY2ZnKTsKIAo=


--=-GLIjW+jlZDns/0mF8iji--

