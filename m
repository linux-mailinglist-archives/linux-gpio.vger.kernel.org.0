Return-Path: <linux-gpio+bounces-31016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA69DieDc2kDxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:18:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9476E15
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1C36301C6E6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3277A2E8B67;
	Fri, 23 Jan 2026 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="G7bRNcwW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3BD22B8CB
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177893; cv=none; b=cT+yvNwkS5xZlWXUyLAt5aU4/xJyi28jTdxD52T056ljNiLPjXIe4WdbC4PM8M6kqTtqyY5d0xd9efWPH7iqMJgTk4hGcGMke3hjI/x4nidbR47hENl6UC1VJGoFsOnaL+vmoc+P4g9lli6EqjfqKpAGF6rRLFHQDC/DyGWBgwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177893; c=relaxed/simple;
	bh=o4Vhy284nR60LjNdhm0XrTm9LZqyrbTcvMsIxeVZ0Tc=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID; b=lwZ/GDGjQWy13y29K0qYGEtwHCSPEXdePjSWVoC7ShQOEMBFD4pOE8WFonpTbcI94RADH3nS+mZ5yYcw+FlvUk6UabG9lqD4dOyRcZY3z7IDOxqJzetQZE617CUMXncMskTK677Z9F5fKJJrklBM1dN4TqchgnyUcJGyXPA8DP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=G7bRNcwW; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769177886;
	bh=o4Vhy284nR60LjNdhm0XrTm9LZqyrbTcvMsIxeVZ0Tc=;
	h=From:To:Cc:Subject:Date;
	b=G7bRNcwWWBhXKEhm+sE+pc4l/1pCNbEW1RyMoOAX/aFiKY8QPMug5jVTLKWlIAFnB
	 Aer7Cdr3eSOxkVrhAOTu79XErLyTIi8hfKKP8KK6YaBqJqgExblw9LClLZGPV+fdr/
	 5jgnIwSvRNQIaS/TGZPsM4ErA0hV3bFIuA7Cz0yY=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: MLrSp7HLXZWv9kZCUs3dZ7m4lru0tYYhJhsrsx5bzO+S+zgQCEWN4ZE0kl6DVX
	 1s9rSbhw0pBNwieBx3Qy+tjTzGPj5smsS61s2+HmNcKKnv+6t5YSzGQ/fxrrnyZgfTqTXG/7PqFSh
	 tWy59XizaROiQhsOC9t1o7JMbKf/jZDX5SFQMecyyEjct1huisqi4uGtiNQDEuKCy4ixJ7y4U+lLp
	 3bWH2nZql30XZzrVn27TB2nH+eVpZUEfqcnFtgGTAMMyO3ZRF9OFyTc5nwHZ42oQp1cnDa7bHj+vv
	 /6M8kKgQWAYt34lanKGO+Z3ZcaEb+dwi4G59izdcCtdh6o0Mq07GJkU5FFZ39WSVljtPK7w8el4/q
	 ULGputnWYEW19roiHxCDd396G72ty6v7gJznY8MNd4P6tOT8vfG7KKuJ2CbDLaCN9vJqfhxq+pGy3
	 ofdrWu1rTOw0oYgXPF0HVB9JJJ9KZ4/+zz5poPx2e+lFl0xQuVyePF7wTtQ/YDmBXdFi0pA3Hkd0Y
	 nPx+Q/QtawIoQMfe6Pt0gk92JSZW0LSdb6+bp+zSw8uDAvRC7mW3EzCmHyRcQXIMPL0rCvwcyexoy
	 ZoepbE/NlJ0kw8qNkUH0AD5chhBT00iYAbw6Du0P2JEpE0dKPwYaY0HPBM/3cQKYBAwgN9dGlP3Bc
	 KQDlA7+iYp568tqXG8J5fhAWmYrNbvu3jTcE/YvxkWvMsN7RB4vj+bukiZ6jD+Dfg9BO3r3MKuqx/
	 J7kCcrsWNmwMWQYjnHcwJmt0l3Sr1i4pdmZoB8rNvGw5jHNiQ1e7LvbUUmKiObrPLsoICmZ1uMFlg
	 lXM08WGIvWyhm75uazh2TsCqzt7NUo35RD22d4xSgTI87IrSvCHZLuroHlMI4/4L4y9bPnJTpesEs
	 SfrRy7ohlqSqyujmdxPM82GL6q/JAZrjH72EKqQyrU+iW/6lxaEzHkbjWlprlhfGDQtM4R7dHIidf
	 qk7foBCjdgaYVGPyd4UEFBKEy0JEndvOG4rRzyPnf4sFHx+Lj1cHrO3GL0E6lNAKFTKKqGddAOy/q
	 qErtG2+ShNOgCC/qLzMp4441vzbyh8D3GqDoaPsxpj5RPqIc=
From: "=?utf-8?B?R2FyeSBMYXU=?=" <zgliu@foxmail.com>
To: "=?utf-8?B?U3RhZmZvcmQgSG9ybmU=?=" <shorne@gmail.com>
Cc: "=?utf-8?B?bGludXN3?=" <linusw@kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtb3BlbnJpc2M=?=" <linux-openrisc@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?a3J6aytkdA==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>, "=?utf-8?B?Z2VlcnQrcmVuZXNhcw==?=" <geert+renesas@glider.be>, "=?utf-8?B?a3J6eXN6dG9mLmtvemxvd3NraQ==?=" <krzysztof.kozlowski@oss.qualcomm.com>, "=?utf-8?B?YnJnbA==?=" <brgl@kernel.org>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: gpio-mmio: Correct opencores GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 23 Jan 2026 22:18:04 +0800
X-Priority: 3
Message-ID: <tencent_F07E7380CFFB3A6A7480FDA42A636B7D290A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmseza62-0t1769177884tz3kmryk8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.94 / 15.00];
	CC_EXCESS_BASE64(1.50)[];
	SUSPICIOUS_RECIPS(1.50)[];
	TO_EXCESS_BASE64(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zgliu@foxmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31016-lists,linux-gpio=lfdr.de];
	FROM_EXCESS_BASE64(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[foxmail.com];
	DKIM_TRACE(0.00)[foxmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,foxmail.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: C6F9476E15
X-Rspamd-Action: no action

SGkgU3RhZmZvcmQsDQoNCkkgc2hvdWxkIGNsYXJpZnkgbXkgc2V0dXA6IEknbSB1c2luZyBo
YXJkd2FyZSBhZGRyZXNzIHRyYW5zbGF0aW9uIHRvIG1ha2UgdGhlDQpPcGVuQ29yZXMgOC1i
aXQgR1BJTyBhcHBlYXIgYXMgMzItYml0IHRvIHRoZSBDUFUuIFNwZWNpZmljYWxseToNCg0K
MS4gQWRkcmVzcyB0cmFuc2xhdGlvbjogVGhlIENQVSdzIDMyLWJpdCBhZGRyZXNzZXMgYXJl
IHJpZ2h0LXNoaWZ0ZWQgYnkgMiBiaXRzDQrCoCDCoChhZHJfaVsyXSBpbiBWZXJpbG9nKSwg
c28gZWFjaCAzMi1iaXQgQ1BVIGFjY2VzcyBtYXBzIHRvIHRoZSBjb3JyZWN0IDgtYml0DQrC
oCDCoE9wZW5Db3JlcyByZWdpc3Rlci4NCg0KMi4gRGF0YSB3aWR0aCBhZGFwdGF0aW9uOiBP
bmx5IGRhdF9pWzc6MF0gYW5kIGRhdF9vWzc6MF0gYXJlIGNvbm5lY3RlZCwgc28NCsKgIMKg
MzItYml0IHdyaXRlcyBhcmUgdHJ1bmNhdGVkIHRvIDgtYml0LCBhbmQgcmVhZHMgYXJlIHpl
cm8tZXh0ZW5kZWQuDQoNClRoaXMgaGFyZHdhcmUgd3JhcHBlciBtYWtlcyBicmNtLGJjbTYz
NDUtZ3BpbyBkcml2ZXIgIndvcmsiIHdpdGggbXkgT3BlbkNvcmVzDQpHUElPLCBidXQgaXQn
cyByZWFsbHkgYSBoYXJkd2FyZS1sZXZlbCBjb21wYXRpYmlsaXR5IGxheWVyLCBub3QgdHJ1
ZSBzb2Z0d2FyZQ0KY29tcGF0aWJpbGl0eS4NCg0KU28geW91J3JlIGFic29sdXRlbHkgcmln
aHQgdGhhdCB0aGUgbmF0aXZlIG9wZW5jb3JlcyxncGlvIGlzbid0IGNvbXBhdGlibGUNCndp
dGggYnJjbSxiY202MzQ1LWdwaW8uIE15IHNldHVwIHdvcmtzIGJlY2F1c2Ugb2YgY3VzdG9t
IGhhcmR3YXJlIHRyYW5zbGF0aW9uLA0Kbm90IGJlY2F1c2UgdGhlIElQIGNvcmVzIGFyZSBj
b21wYXRpYmxlLg0KDQpCZXN0IHJlZ2FyZHMsDQpHYXJ5DQoNCg0KDQoNCg0KDQoNCg==


