Return-Path: <linux-gpio+bounces-34647-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOSoFbXGz2lH0QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34647-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:55:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA5394BC4
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3393430672CF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313E0306B37;
	Fri,  3 Apr 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy6V79kX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEu5G6pI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FB72EBB8D
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224329; cv=none; b=PrRAn0ROos2yo3Uvbd+AnnriEgbJio7gJTodSBh7J1L7+LJHy8DriJwhG75KJTJH8ki99y4NBWMVIFrJ54Rbr56dzhv3K3Sy9nLVWKLt3kF8+CBlvEm5ecDRX7pOcV7b3CVvvVTlqvSjQlTUNg1L6knEyXo+W7r2bKKDabw56sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224329; c=relaxed/simple;
	bh=NlWOA6UrBUxPU2ZmL/Aama748Uq244oTOSPRnxCWr80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FpXTrTUuVktenDvrbKvyZzZvKdDjE7AdScYJBI9M0k1WMXnY1icp8SIcXf1JbpnQvVTcMmSS82vddMm3GS5GoyDkWBp6nO3JwovvXCpcV2tG3Q+K/XTNogq5M4WJx9f4KxWidILQOdwC0+jh8lOgS+SGxkp+qKLzNGL459XAj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy6V79kX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEu5G6pI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336D3up3772507
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 13:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jncd9S+sPgUnlMtnW1kBhI
	3ZQuWK02IAKrgbnLxtzqw=; b=Uy6V79kXpcuITgY8AQLFAO2QboAK3c6Ukc/jNq
	NNS1GhOkUrLZqRV/4L2c7Vj8CccSup7x21tx3YhNiBscrNeZK8//eLN8mS84JxW5
	mqvy6cXLwX2bTAd7jplLELf7jLFC7eYofCrrQeNd1ko0TPkcxyChjCcBBU20UJvE
	VXHj9zDVFghxgk8bzolx593Un0nygJQk4p2fItgmLfJnYF2CDupCHB4iaBtXU/6p
	rF87apN4QKkethSsvEsROoBKqxrMsLr+cfBksUjnlb0kXro6O881/lvKBtYBUoYH
	7T1z8Vnw6nCxax+YX80pSfPNfBZMN8gSeJIJqPce9bvMlnjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs33dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 13:52:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso91619291cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775224324; x=1775829124; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jncd9S+sPgUnlMtnW1kBhI3ZQuWK02IAKrgbnLxtzqw=;
        b=VEu5G6pIXUbsu943laVERkpJezzcbWyJN8A4VDEZ18wNrVKXGH+I0L2J+VgaueVr7s
         k+xqUQdNtmlYaT5m1F5J8nSgWZrmaHj+DHEUtpBWkHooXV0+uUclr7lszRl7ZT7ibqfI
         affi+D2eVf4F/bUGwPLFKLzdMVvvz0ZQQAx/M2t2LH2Gcg88BvNv26u08qirzpYobRkM
         rh2bqRLGhTnG+VxSLehcSiNgrGRkgy4qtk3VkM2cKzuxCpUAuV1NKBknakVUuKddSQ87
         tIXJVTb45WdCx5n3SdbLUgtSVne3zSRmmWwLcpcwamD33XJ2fsfgxv7il8vpvkERj7kI
         qFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224324; x=1775829124;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jncd9S+sPgUnlMtnW1kBhI3ZQuWK02IAKrgbnLxtzqw=;
        b=RdKEr34izj5rEobY7LcCWasronAfw+x176eTyOyvb8BAc+rSvqU9yz/cXzpqbzCAjO
         BeQg3szrxrCM4+3zgqRjzkMCg7LI586JqfjRj4k+cpH38CD75+zPxSUznBaEyYOAUOJx
         31aEj8yBGY/WTqdvrl7rXR2fGCTZbEqknbqdxo2xKsL4LOB+RBmG1nDPfSjYdnsPQOZr
         EGU0gNfLh0x6rhiQh6DKs9ADKJL6TYUEpkLjOhkBV0AVgcIcJR8VnYISxayzofoR1Av+
         Sx6uDD13qTiK2knMSVvPlxARVY3htkibKL3AuMuANQrk30lKLKP2wPuGkv60X2hSU0J/
         15Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVKZD13ksOZSoZwgIotsF7fmkD/VR7oaWNq54Zbq5/u2jPlxQoh0wEx3ToUe0xamA6tV7Jk9YkQpALK@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTxkz3+IxKLFUjKLds0zJl5lK1YWHEqVdzL8Z0VmzHr2j2N3G
	PjvLkmKFFiHabbtqH4mz613HV/icDTj9JXwencS0Od288zdnzavc0h2Kj/QFR7m5lp1WFx2PXBh
	Kmv/vf/t4MrtA876sZieORccN6RgFW73rYK1CzVXBqnPjlrDvsL1cXywafk54RvhU
X-Gm-Gg: ATEYQzy92OLSXDoS6X1RIaN04rvB4P0l2VLJIA7mvBnQifBPZ9o5suQzYrde2FBtd9t
	XhIjzNxAJrousg5xSC/f1MayXkC1LFuo2Z4KzSFch0/muGX+3MSHX0t5deSPA3+I2atKBOoYuTG
	J4xSVSD1bhdubJckLS9FqG1DC3zaRJBS1Yb5B4zLcyCG9PARoK0FQWbJpHhVC9SvhogH706HpPj
	Eb9QCO9lvorJy/J0c6/tXLsbuZZk3lhCqrbfxq34a68bEWNDm/+gXBhT1VSzDcYSd2KS7eKGRSH
	DHIeYmXtem818RW8/c8vnaY14+yFDGviExnO7xATY521pxsQwpKjN7KhAi3X6EL65pxZ+SFqSUr
	3TcjqxlmnzPzPx3hPkFSCkeUEgQmhZart6eGVI0e5Kf6XBC9ccXcM
X-Received: by 2002:a05:622a:260f:b0:509:2448:410 with SMTP id d75a77b69052e-50d62ae8458mr42937701cf.47.1775224323913;
        Fri, 03 Apr 2026 06:52:03 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:509:2448:410 with SMTP id d75a77b69052e-50d62ae8458mr42937351cf.47.1775224323446;
        Fri, 03 Apr 2026 06:52:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm16948132f8f.21.2026.04.03.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:52:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] driver core: make references to unregistered
 software nodes a special case
Date: Fri, 03 Apr 2026 15:51:49 +0200
Message-Id: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXFz2kC/x3MSw5AMBRG4a3IHWvStAi2IgbKjzspufVKxN6V4
 Tc456YAYQSqk5sEBwdefIRNE+rnzk9QPEST0abQmbYqnH4ZoHYvmJRg6z/Z0uWuMuicKSmmq2D
 k69827fO8EvG3YWYAAAA=
X-Change-ID: 20260403-swnode-unreg-retcode-38b5b92eab28
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NlWOA6UrBUxPU2ZmL/Aama748Uq244oTOSPRnxCWr80=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8X6M2qYjAHwaPwqmT/pp9+4mIAqzXsPY+bba
 kOFCo306GSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/F+gAKCRAFnS7L/zaE
 w1LuEACh3O8artkXQUwfvuuCLjG5ktBfI+U8MJhhKQCCBPkRGQnZ6rphdma2YLCZHXYMRx7G27i
 GV8ZdKW+/q+QQ6h3mgev46ldzgTc5MKF5STbxlMc96ctIr352g7BhqKNc2az2ItE/YuTLTbGFe3
 q+c7VXV8xoD3e1AZR9nEvGZd1rPnx3SvAf0MGNUHebfG7umL/jlHx5JGPBdHdxJ2ogP+rCW3Tc0
 ftLLcX+fC/2oWOM+b3lfwz/Lxps/oe06HmPUwDVcUeotQjSNBUVGOmp9ysbHka0LQYUGfe1MC7s
 6lyO8m6wx02afdnNLPFDAq/9QuBm80TIPT6OQLJiEVcqs8UE+z/hAsLaJj8IHaLxQy9N7iS8VLR
 8q3yE54xuM0fomeiy5yFI76SYHYXIMB9vajE0cDyilOuKapYBF8QXzwxIAqojSqJkKdAEoucHeD
 pV+DXYZNsHo/2ePt1/SF0mEvlNFgKj6h/qeNYC+ttJWVgsha5zvj7dRGe09z0L7oMsXfOYJWnLS
 /zdwt6KHQvf+Wj/zLpWz7DDc2It9cspD//3kDzP0AlKnZ2cn4vfjh8c7qMp6CSY4mEImYBbfJ8C
 kk5t40EMKxz0CI5BdkSm8J/g1o+stvJgX+6p3lXxW+4e68ZEjWL4LpXJZPrl/lH1yijL82eTFsd
 po+o2jNh6+zmkog==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 0lpcoEV6fVq7gIWkG5tKm9xjllfz7EKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMyBTYWx0ZWRfX4UywfGj56MEz
 OaZ3Jqv90/bTFbyuM7PuRyDzbps3GgOdhNKhpcruaCMo5faaBitUNCWy5jVbGvLq7EVu8lTiVkZ
 XkodCMVesUdky9LphH7UGzurfdFuglKFo0BmUSAHrI58+IPrpnUC23fqtTkXrAFL9fUho/0qjdN
 bvT3tMhh8GZXaHLv+hlsaX/CPc0W7gmZjX5e6iCPsRtZHrP97CGrCLGQ95/YFdQy3uifn2WNd7O
 QSEYXSINaW7FC7i4uqqeMWfFIrHCiXmpkeYwRR+QBkzc03+M4o3tBIIpzv3Po7Qc/Vt0TTKNQy7
 DmiBtvNNVm6ROQCtOImFIwvmmqtR/H+N52h77dFM2+sd4mcr5CE61k210mf4yOpF7KLaZK2Z89T
 uNDDpU2L9v/oSO088ScMfDOgJ21BAsBZ94P475r7O2HmHWtRtU+awLHtJvyLa/+6fwHhtlhxDk4
 TVtnl0QCTmyrXVAUGug==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cfc604 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=h3m_6F4IQ1uC9WK5d8AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 0lpcoEV6fVq7gIWkG5tKm9xjllfz7EKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34647-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4BA5394BC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I spun this out of the bigger series (see: link to v2) in hopes that we
can get it in for v7.1 and make follow-up development easier next cycle.

This series proposes to make unregistered software nodes (ones that have
an address but which have not been passed to software_node_register()
yet) a special case with its dedicated error number. This will allow
subsystems to defer probe as if it was a firmware node not backed by
a device yet.

This is done in order to allow easier attaching of software nodes to
GPIO controllers and the removal of current label name matching against
the software node's name.

The patches can be picked up independently into driver core and GPIO
trees.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Drop x86 changes from the series (will be resubmitted later)
- Use -ENOTCONN instead of -ENXIO to indicate unregistered software
  nodes
- Fix retval check logic in gpiolib-swnode
- Link to v2: https://patch.msgid.link/20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com

Changes in v2:
- Completely new approach
- Keep the cherryview and baytrail secondary fwnode handling as a
  driver-specific quirk for x86 tablets and don't introduce any new API
- Change the return value when resolving a reference to an unregistered
  software node and defer probe in GPIOLIB in that situation
- Export acpi_bus_type for use in x86-android-tablets
- Link to v1: https://patch.msgid.link/20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      software node: return -ENOTCONN when referenced swnode is not registered yet
      gpio: swnode: defer probe on references to unregistered software nodes

 drivers/base/swnode.c         |  2 +-
 drivers/gpio/gpiolib-swnode.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260403-swnode-unreg-retcode-38b5b92eab28

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


