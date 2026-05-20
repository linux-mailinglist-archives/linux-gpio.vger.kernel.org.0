Return-Path: <linux-gpio+bounces-37185-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNO4FAt0DWp0xgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37185-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:42:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A786B589FBD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF95312684B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 08:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900F63AD512;
	Wed, 20 May 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJB0KVmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnzI1bA+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB453A5438
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265322; cv=none; b=hHLxc1YpK5DhoC3eXhgg+hjyeq97MVe1O8gdJ0GpfWQ5Gr4KMsuJVj8dv2CHoBJEPLjaGjOD6O5ama2pNZNq6LxKnpU8pVDBTj+LwIez0bfBvn5fKv9WwV7tzLk+9VBZKcX1Ao+zHVyMZPwa9/FfXiNxkxc5LyvAxox9zXJDrcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265322; c=relaxed/simple;
	bh=028gUqW7WcOSmGF7+T+T+hdvUW/4C3HpqpJfKtSYg7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMSuQ5CVguc7U3kjB1SU+t9objrJw3dnCJ+FmlvmrQiWetf5uwqjNvf1cG+3RSLR8+bbwIHnoZAS0D1AUwyfAcZ6ua9+eQag1d8seK2OjPJF2QNECL1G+7dwT77oKxs7r308NOt1Us/bdFC7mZUjUS3Yz/hrgAepDfdZv+Fk2Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJB0KVmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnzI1bA+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6ig2q2983959
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kctZDDV/1El3U8lFByxFlfEBdTTDs6EeFVn0Tn6oObg=; b=nJB0KVmuz+3g9tRa
	RQe2ZJVZDteKYusCG6azwqiv0LC357PRU1SRExEaHxKne5zCOls7c1vkWaivrn9v
	h1LfQeidP0/evCcPqmerQLWnQ8FpoG0RczbG/RVaubc7UDPW2y0UcE3XOFOypbqP
	AhctUpiXP4QBrdwL+M63xWBI2YSQq0CCp9p/w70v+sq99qhI0zGR+ABNlpByjpZl
	/UbwijDtT1uoe5O4NUusfThwrGIIfPC/jIoGzThzng6zrSgOeFUW5etbJC4H/ga4
	Ugtbms+2ul11LXVXtHndqXpoHW5oW0uPps2q+DR1BdGxQkd5RXqAflvLlLwXiUtf
	y4ocvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3urf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 08:22:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so101518041cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 01:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779265319; x=1779870119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kctZDDV/1El3U8lFByxFlfEBdTTDs6EeFVn0Tn6oObg=;
        b=HnzI1bA+hMAck2x1Dbg11k3BUFIv/asaWQDpbBDA6p9JMByHzOYaXiIwjm9YILih4i
         CGJyA5zwSgx8ytmpO/SkAWA3pU7Hp3Th+nVxEaaAjgAZ8Lw0SIrU6SSq1LrH9+c2SraI
         1Y6a/ttXNSEmkyn2N2JA/VrtdyvdyLMWCcngqQuUe5bjkdTnFbX8YMPut+nFWrPNZhou
         IBKXyab1ZsnsOVIrNkVMkHGH3mF5zia/WXdWJ4++6UtS23H+kMWKlAXgHXgIq+ktPpPN
         mLbb0TjlslKpHtsAA4RuUAPeJzrhBsaNHX3rQB9w+UJPFh9XmwxqNUI6wEwUOWMgrTHC
         gl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265319; x=1779870119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kctZDDV/1El3U8lFByxFlfEBdTTDs6EeFVn0Tn6oObg=;
        b=tORaWOrwAbE+G9rRFwsZTefYJHqXeJT4RUkd5TnzNb5sK4bfN0X6umyj+OPCyDLQrZ
         dSr0R0Cj52qozWv+roa/SPKBcl9BZQ+X1xJqMNDss2+8b1XcZuoisE5t9JvN5NdITdWh
         IogxGL8wZkieS729mM8Qyrofe+QIVlxvr+5ExZ1PFOxfE66DiMxPP14Auf0YwrJrQhuc
         FUldrp/mLnNxCi9WSXoUkhWhDLjecboi5WaEDFM4SCHjA46tZbOmS+qOzLBrQJi/XjDT
         IbZrPrmuujj59TwHg0Lf6Av6WnIkpJW3zEaH89fQDzQGFy14zLIuV4olHQhSEOuPZJXx
         z+Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+ejxMSPj5UcwSs3Pj2UGYg7hcofAhFK4IM2H3D8FVER+/fNMQxeQNS1UtPVkmyS3CiwoXCK7ec5g5b@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8aKX3MnJOjYiqVoQaaMLPVIcXuQldS1zzpS4strIBLQztXfw
	DSI2MJy9d7qd1n0Oow+vnOpCOjyws4wnlTbwxyhqe1tLBzNzGVYmmCycweJDfsDWrzzGGNRITJG
	GkALa0NPt5wSOlf+euBO2+VEVKQovOIiMSnJ6mW2+r10ijrTwRNiQMd7SDs+aFd3EK/eN5rOA
X-Gm-Gg: Acq92OEotennq+6R+EJDW3oEarDUZOXSeHjjfIqpPa6DC2S5wlbsi110vDZ6N0ZZjzD
	j+pCmablmbpSI20PaiARF+STltBvC/t6u6x5ye7pB0AeHJaIWL4pQkwgqVlBlUV3NaY61vO4onS
	/rVKVvQlHiAshOBy9frx0ZhMmJo1YVG+l4vV7WGRfYO0xqo4Q5s10AZ/b4GNFhJFF4UL9JB6oCr
	cOGbAF5YhTVuVCE4Dupa8LuDgpY3qLWLSgNxmfQUnDYUkTKCscqDqM/hiRzwoQsPH+1SxioYetR
	ktu+0p8CUsP5G4Ce+Vb42+RH3psTAEm+d0Lqbtlma/wRXzEE2/i9oQO/wOYbSfa+oUW/VIVpqno
	9D4kbf3yCs+EnYt1/Y+VkSODGgHLDyMuKg0sjmVEeWDXqCKzkr28=
X-Received: by 2002:a05:622a:4184:b0:50e:defb:77db with SMTP id d75a77b69052e-5165a012110mr38250681cf.10.1779265319328;
        Wed, 20 May 2026 01:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4184:b0:50e:defb:77db with SMTP id d75a77b69052e-5165a012110mr38250551cf.10.1779265318909;
        Wed, 20 May 2026 01:21:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm51518570f8f.5.2026.05.20.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:21:43 +0200
Subject: [PATCH v2 2/3] kunit: provide kunit_platform_device_unregister()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-gpiolib-kunit-v2-2-cc9db39881da@oss.qualcomm.com>
References: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
In-Reply-To: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=028gUqW7WcOSmGF7+T+T+hdvUW/4C3HpqpJfKtSYg7U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDW8f9H6wweB0pF/kIjU1nB2QZOjtHRcNHof2K
 jNeKC1uVq6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag1vHwAKCRAFnS7L/zaE
 w4oHEACQcllqqw6uFpKO+4gOkeWpbtB/pXUDDYB6uujlCC6DcdE8UDFiEBORbbBXDZc5rIrPQc3
 vOtJWqKRBbgDXiKajMovxDtyIrkXj6YpE64EyJ2+J3Z5DU2dhg/Yllhnkckz0plvbGEJ8rxiLgo
 U7GCJLK88Jiw1EWzIWFvXMbcO6fFkkeWz4bxdqncXqcX2jwoBYfVh8R8ADjDklYNBd3pSH8j6iK
 GkBd38EJjanRwdoW506/k9f9IWZSAVgZJV/O/bMhsEGXF0zI5Nle6mUghPrbS0xnl+EmFSr2mj7
 +DF0soO15MSdT4GBbs9VBwQf9CoK2ro7I3MXGMHW/exRIkMD2aBMZUa8s6y75CnL/mKJ6jnZBgu
 w5593R7rn1DIOlFd8F0OHZ7FNXiCbEfwdt9HgoUplIXAp78QuSLkkM06ZceRBDdjanc/ScJvDgn
 EJhKD67Ib2hFx3hItvJ1jvYqmRy73HL8POClLN+0ZUnHN7V6g38oJZAfxntqQ8k4chbJ00f281q
 dDew8oFwNgjaiDeyWih45Ny8OsSIixjy1G8SSufs5daKiTUzAg2haCIRzbFehkr1PJtCIuKuAjN
 JZAEnlJtU2morW4H5G3ro0tuXvWoztt+elyI546Z2CzvwDF/tkQiF5kVWWBHf0HKJgmS0W9PxNw
 +BUj+4nAfSEgWfQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d6f28 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kmOvhMkJ8j3s7cJ8cD8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fisvj69WfDM6IcdwXamFyrwhKNhTRjmL
X-Proofpoint-GUID: fisvj69WfDM6IcdwXamFyrwhKNhTRjmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3OSBTYWx0ZWRfXzD1d3ixSrOa8
 P94YDfOcJ+Stwd8ExblDOh5vSoCrMoh2xLReaFU5/AHwKtX0nR9bDA5MqlmaPH87uCmJ01llx2E
 hgYKNi9mtpn1tPbwDx2IFQHsrJguzbMgDg6inRzABiuRDexq80Vbazw7Cf+sbP8l4dT83U4l/kl
 7SytkbcG1sNPutLTBuEwBgbmH3B4jCxyxRm30bd7TrMqPUa51EDCxGHJHpj/YsLmw6wWtoY7lkg
 C/ZIhFln+LeHVRZDkP/gyWxzdbkdzWNUkZNSjOcYylKCZyxGGJUuYI+OLqh3WK95CnneGfnzYCy
 u5tTbfQge07l6DLxJv/1g+k9QccTk85cyVo+gdIv56zZKefZP7IbfTQHF+7H4OWYmf5Y/QNrCJU
 FrjW/bH9PopvhU6oRgKzIBYPFtvwfnj9DnUj/ufRPK1EWSgjQ+rDBJhDztSt24GcP+gb0QkSIyh
 1Fo4RJgWo4XEKDIh7Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37185-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A786B589FBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tests may want to unregister a platform device as part of the test case
logic. Using the regular platform_device_register() with kunit
assertions may result in a platform device leak or otherwise requires
cumbersome error handling. Provide a function that unregisters a
kunit-managed platform device and drops the release action from the
test's list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/platform_device.h |  2 ++
 lib/kunit/platform.c            | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/kunit/platform_device.h b/include/kunit/platform_device.h
index 8cad6e1c3e7efba862862b579089f2f317784a73..eee565d5d1d35c1d1bc82b45eb91d21d00c68428 100644
--- a/include/kunit/platform_device.h
+++ b/include/kunit/platform_device.h
@@ -14,6 +14,8 @@ int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev);
 struct platform_device *
 kunit_platform_device_register_full(struct kunit *test,
 				    const struct platform_device_info *pdevinfo);
+void kunit_platform_device_unregister(struct kunit *test,
+				      struct platform_device *pdev);
 
 int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
 						 struct platform_device *pdev,
diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
index 583b50b538c79599ebbf33e261fe2e9ced35efa9..ccfbc70b4e12817f60490e8146f7f7773c9a4dbb 100644
--- a/lib/kunit/platform.c
+++ b/lib/kunit/platform.c
@@ -161,6 +161,21 @@ kunit_platform_device_register_full(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(kunit_platform_device_register_full);
 
+/**
+ * kunit_platform_device_unregister() - Unregister a KUnit-managed platform device
+ * @test: test context
+ * @pdev: platform device to unregister
+ *
+ * Unregister a test-managed platform device and cancel its release action.
+ */
+void kunit_platform_device_unregister(struct kunit *test,
+				      struct platform_device *pdev)
+{
+	kunit_remove_action(test, platform_device_unregister_wrapper, pdev);
+	platform_device_unregister(pdev);
+}
+EXPORT_SYMBOL_GPL(kunit_platform_device_unregister);
+
 struct kunit_platform_device_probe_nb {
 	struct completion *x;
 	struct device *dev;

-- 
2.47.3


