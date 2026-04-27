Return-Path: <linux-gpio+bounces-35583-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBkKL59u72mHBQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35583-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:11:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B8E474164
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4A44305ACAD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31B83D301F;
	Mon, 27 Apr 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDofzOO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIIqSbVM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A49F3CCA11
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298447; cv=none; b=DXoq2K46eJXUElEj0Im7VN9Y45mVz9RaIISxWJRBqjC0pqTg0gyZgC0sgMNT8B+oKWZOzLlNWBr09RQkYCvvP4v9RNU0AbTTdAZYej+vyKOJ57LqkcsXFNZuxcQwjb+aK0dL7PDo4awwvKyaUs/KjElP0IwVMXMpFqCCg6Zn61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298447; c=relaxed/simple;
	bh=bP6HA6pZjm7hEbY5JnHa5ksDdA+WtVqVV3UGDdamgPQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mR72iBgHzae490p+heVXiWKVOfGltaeVyzP9a2sGuWsGQw/O7hX57ernZ3hjXST+DXiBnNfWq3HDean4Jd7T6V3twGWQpYedk8Zb/0iOW/YT8ojxifaYtQvVjCkYW6kroCU2O/DTtZjgvTu1/dw1EGyZHoxlIq43gz3scmCe2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDofzOO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIIqSbVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB7G8t1237530
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e+qIoID6Yg+3aC2B7pB4TK
	5iyob/h1HJrqolQGz2E9U=; b=gDofzOO4I8TAtexZFG8UXhv9/zU/JniCYKUtYn
	vzGfjO8i2ThDssKjDIPSCX5J6b4Si6UrGgefdw4u/iliYq7x9S0d5tNnIh1hcIkM
	XAjU5Pe8+FnUSyzOn0DmzPaM7bg6FdPt9NqW1eJ/aXng2owDtCLkyN+icVZ5N/Vm
	FZcUeyuewHSbouCdrxZEz8BG76/riFZvRdg0W0DgSCV2tenjfwDY6D4QeLdxxDOr
	bey5Dg4+fzRPAJKtjYzMTQYlWpbKiAbptL+33CD5Y+bS0yhNmuuqdbyTYRHNY//d
	ylXVmeWGTxjyetxRp2mmbmzaGcAcjzN7+9avrvYuzyZDUqoA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4gjwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:00:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9568707f486so9212207241.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298445; x=1777903245; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+qIoID6Yg+3aC2B7pB4TK5iyob/h1HJrqolQGz2E9U=;
        b=EIIqSbVMAdD53N/qRz1kUl1nRlTkHI+I297XJPIxFYYJnAe1ez2Gh9bNhwZAQNdFN3
         G7Y8VWeqh5fPjawS6zMCX113iCm0yhsDEezXfcU4jWGZLBvlTXEYWEFWQvHjEh1p6LG/
         9xvAEQKZ1F/0FqRnIF3B8a1Cdt8uow+K+vrUgcjmbi17pujwZ1BmxWsQ16j0WXzauXXp
         DLM12lU9MWXubX6chXBipMAkSbWvKshmXl2xvR0R+kiP6ZAAjrhkMCXEE+h9oJzOvMA3
         PkhrkOJP+FF7XEKCxkF9VqRjRj48QKRxffRNYWeTjeV8PRTK/tI4OIXDNDzt/X1OwcOZ
         WSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298445; x=1777903245;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+qIoID6Yg+3aC2B7pB4TK5iyob/h1HJrqolQGz2E9U=;
        b=ZdsO/K27ezpOzzTKr9SBLR0UYVds1tH0KBn/1eI5EOazjvtTZfuj8326nqhqvDfTon
         3wIWMQJjmXN0knJAliSvLPwVLLrCViHzuMMg6wu2bn8hkvnqUjlODvHgEIGn1rVucPth
         hyuKUenbtVYaw33MKa/SJV2p8/BKSmmXOZUrz9rli8nhOvAgRGcdR2KwlwghjJVr1V3q
         O2BMxw8JT27cjVGARybXjow10eA7qSfIJXm1iX0cvBa6+Tpnsjlf30no99VUlqVToGr8
         ig6pyDTUfRSTkLY/jFtEEKhM3EgJ6tHzzYkCLtaXcwgRrZf5qrLaS06brWrM2cdFCB35
         XQyA==
X-Forwarded-Encrypted: i=1; AFNElJ82z1EgyiLMop9yNrxP8DWDYcjVHHpCC6oYrRqeO1lhKR7uJr5Mi3LFMz0Gnu74JBpNPldgnFbI4tcW@vger.kernel.org
X-Gm-Message-State: AOJu0YzchQ3PRfFrUJ8B8fE5Zq8yeYqnFnfV0e4fGUE83UhkM2hCSqmo
	O5N8SB0KntPNcKoc5fzDQbu3sO2wWOJbw6b7wChnFd5rdR06BVfqnN0uO+ATr2pGL7BvYPu3vGJ
	B46cPp59QBV49SrgaaEUp4qOn8Bf9d1k9jgGlKK7S29SqKcubCg1VX22Wb8ICLPiRMR5PFmNg
X-Gm-Gg: AeBDietyfzQ4cCpyEOSekk9IAUIFGNTE2zKZr28atLlGQ/9O3q1Usv4Ehy08ZvrD9xz
	LyeooW1QFBBYGjT5VBFiz0dyWSu68p5ywkIh09CdG8Az3DHViXcVm0HSxnHtr1TwCl+Lcd8LQN6
	sAP8Nk9eWRsP8TFw/zBhNFecd7tgXFrfUVSB+Ze7+IB7J0lQKrjUHy7KLt+5Tzwq0g8zqKufFfN
	RKU8GpPRkhd+C1w+Dew8PYzl1GH/wkMD2M2wX9G0IdSK1eW/CvgJ6w8Cty5MmQwfHmMUXxuxStN
	v4+tJDe7uP1FPISNzxKlApsALP/Y5RU9iIQlc1pTWiStKu8RENntc6BQIM9QIXDL/nGgttQ3muq
	9BWDYPkAzzJ+0gqiTf1rPAHQoM/83/1MttEhCfVW5ZJ6OAw05Sf1YW+wmUya43Q==
X-Received: by 2002:a05:6102:b10:b0:611:82b:a590 with SMTP id ada2fe7eead31-616f73f6ee1mr21753653137.25.1777298443204;
        Mon, 27 Apr 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:611:82b:a590 with SMTP id ada2fe7eead31-616f73f6ee1mr21753575137.25.1777298442558;
        Mon, 27 Apr 2026 07:00:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85d0:5328:3f13:c3e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm626849135e9.1.2026.04.27.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:00:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
Date: Mon, 27 Apr 2026 16:00:28 +0200
Message-Id: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxr72kC/22MwQ7CIBAFf6XZszRbRIqe/A/TQ6XUblKgQiWah
 n8Xe/byknmZzAbRBDIRLtUGwSSK5F0BfqhAT717GEZDYeDIJQo8MufDwNbZWnY/qVadJWqjJRR
 /CWak9966dYUniqsPnz2dmt/7r5IahkwoKUaBqFvEq4+xfr76WXtr6zLQ5Zy/bOd6sqkAAAA=
X-Change-ID: 20260403-nord-tlmm-b5878960cec6
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bP6HA6pZjm7hEbY5JnHa5ksDdA+WtVqVV3UGDdamgPQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp72wBv1/nO6x/9nLQf3pM5oeNQ1lnuKL1EZSMA
 RJ1XvrHqFeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae9sAQAKCRAFnS7L/zaE
 w1M3EACON20QyLwDiCoNEIMTZZVSwoXpmGSDFS4F949jGpccdICoTjVZLof23FFgmfG5U7OGZq9
 aZxhIcKe4eck97XE7sc+urLbgjbXLapWv1Wm0E2D18hpHJcRcfFW1/7BQdRyfwcpfbUJ2egRgjA
 jt4VxooIw6MGU9yIBwPWx09kfC63R1jvE4VkEBw3D+Y9sWcHHxbBSws7SDz+gM5+xMnms4dHJRl
 dZRDntz795lNy/0G4RRYpUEFMn90dAHhq1A6mqRAfZkE+P39PNUnZoKQ+06RrunmedmynTfXBcg
 +zTUekOyJ4jAQ7bVqjOys/2YJzyihVo978XZ2g52JQloO60pNLw4C0pmeUnF6DEsvFqOGfwvmzc
 Gv6B4r9Bn8k6KOwEPH1D+fJDQhn86b98nWdcJ6D/kO2Oe4ITDIKePPtNlFeFqAbcpTE1Z3foVmO
 l8lfCemf7Hh4hQGW3aZ/NW7HGhXy57QJMvYclpnNSYJX/aZ+6iUwprC7eCP7NP7W5TcPSgD6gXA
 6Ekir5wf5gbkl4AoQWxuyNOWFwPMLWaUobbl5MPe7h67CN5CaY+X0gMzCHF3KNUELE91/KiF9sP
 eT4sos/jzfrQvjyAVX9g5ILPuh4mNIx9bVekKOOeYMRftpgi2M/YoO6uv2SlUC9ZtUnJvP2XA9x
 BN9CTFbIhVRgaDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ifoH5Cw2aaLAHo8FXQP-JO8MSxEkmUrb
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef6c0d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=qGPvtIwEQInV9_J8vEUA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ifoH5Cw2aaLAHo8FXQP-JO8MSxEkmUrb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX/Wn3TVSigSEc
 9CF+B6aagjFIFcxjdMT4FFE7qfozLxiJMAIFOGnoSANjj4v0kXkn5BozRVHOH3DDUrqfyiziLFx
 cR4nzBl6evwSNgP45Uc8eCXxkn2KNF8Sm9X2SRsMVfqhyxO5HyDJGy8h85mIUxhD+E/oCNifRMA
 e4kEU649THgiNF35DYZuzs91zYEIig4EI4BiKWWVedRUNYsC/hu7Fn+k7eb19XtZpuCi+p6sLWC
 2KLbCCL3tnyIJVmJ+2SQd0mfcIfNF2wgWgr98BFZUws64zQazJwvimUW6gekqd9PxYl2Vj9Ig1Y
 BiaEz3BskJzMRUo7b5eP9ua02R8ofQ3H+NxRM+3BFU2wHXymBPgqdlK/Vy4E/u9penFGEf5cbtu
 Gx5FoPdqfCYawCQ0Axqof5+acFncz7BLwWkyp7CfOiXTlqLb7CWkn1ueWA9euHA9d6xVkdDJ8T6
 lPRwly8HHjBSgr/I5tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270149
X-Rspamd-Queue-Id: 32B8E474164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35583-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This adds DT bindings describing the TLMM controller on Qualcomm Nord
platforms and implements the pinctrl driver.

More info on the platform here:
    https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Order Kconfig entries alphabetically
- Fix the regex for the pin state pattern
- Fix maxItems for gpio-line-names
- Drop unneeded line break from bindings
- Rework the pin function naming to make resulting state entries in
  devicetree more concise (drop the line number suffix)
- drop .intr_target_reg from PINGROUP()
- fix values for interrupt entries in PINGROUP()
- drop unused SDC_QDSD_PINGROUP() and QUP_I3C()
- drop the arm64 defconfig updates from series
- rebased on top of v7.1-rc1
- Link to v1: https://patch.msgid.link/20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: pinctrl: describe the Qualcomm nord-tlmm
      pinctrl: qcom: add the TLMM driver for the Nord platforms

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  184 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 2843 ++++++++++++++++++++
 4 files changed, 3035 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260403-nord-tlmm-b5878960cec6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


