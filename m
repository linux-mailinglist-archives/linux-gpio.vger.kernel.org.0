Return-Path: <linux-gpio+bounces-40111-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iLHYE+l5V2p6OwEAu9opvQ
	(envelope-from <linux-gpio+bounces-40111-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:15:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE5675DFB0
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NFjQh6+l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NeJgH1QL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40111-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40111-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59FB33046D7F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CE8438474;
	Wed, 15 Jul 2026 12:11:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988FD434E55
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:11:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117467; cv=none; b=Sgmn7cbbnvKOARu2cpXs3WeA7QE0m9fixjipwMuRRjYknTQvwgYlnUEo8ib1donJgxjMCCNF/HpmYgS4uD3kQ66gdLgF8nZlqiDZVOQozs/p3eEp/qHCHpdy9xQoHpvE/IiHmO9qQGC5x6Hiu+20mVVmBeWrsYjiPWOl8h0Sxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117467; c=relaxed/simple;
	bh=rHjQyepCeOM2UG0nWtCaA63D6kxo8EItAMkjv0tMPGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9cqolLeUKJxvCjnMeu41i+U6bwSjXVdXxP1IkIn6+d/aQhdoDmsD4UT9jIVRBC44UGrd/j8F7BPtivZx/0DS7kWfam44jd4kkW0nFHXzry4zE+Kp+zNrsB19GBGfSI1PcQz0KWcU+v24SCZdHPrPNJ3VaEinBP4a+m13nV3CgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFjQh6+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeJgH1QL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcdXd3599393
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/r1v29VLSvgMsUU7R0kEshaMcEhvXE2Ubp0lFFZ+0QM=; b=NFjQh6+lEYY3joYD
	8iE3+cUGSXWMU7fGU2vpIne7S6BUtO8C2pfbaVxt/N8dRYcBuVGVFAYyItrnCqH+
	PAvU0hjOUrnWBoHKVf9321gM6YqLLu81BC9aaeYUgXQazwIG5lgDn/xEUoEBhdbY
	bFMdqybqa7qSwpEKmwLhTd5xLaDMjr6caphV6HEwwbf1eDBICNukiVAmANE3/eU9
	5vP+C4sQG3Jop3qARBGV3u2Zztxz9PdOX7Gnc++P079KglJOteJrCt3IRvtLF74P
	1UzSR2EwN8+SopOcyYFEP85X1OcaorB+9JKmGR3LDrSw2yEFITrGiEHIC5Mz5zf7
	3/9IkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60k06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:11:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so82576361cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784117464; x=1784722264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/r1v29VLSvgMsUU7R0kEshaMcEhvXE2Ubp0lFFZ+0QM=;
        b=NeJgH1QLy+Y6crxYcmDaId8cOXkSwLXYUeLtTvhEdDYnUH9IFv2tAu0CD9K+7r+YVR
         4OZKNmVmq5jQw+IveTs4W8MQY3Q8RIrfNzSZkf1AEx+B5ogATBvo4Qsifai7c5PgQFLg
         1pbTKWVpCwE7GYbTIgF8dkdH7kquvLnxVca49f+0OCJmw3OJtx0MNQG+tEUlYNbjsb5F
         osGx0FJYwPHHtd5rLj6qhyaANf1koh0QzD/GaN/VASixzZ9OC3eBaxQB/limGtm+F+Iv
         YMUJ9yz/vem6BDQ+hwmFmpfKqlaIATCt6WT7G9juzumzMUHOm94n2gm0t2GKktyKaAnU
         DyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117464; x=1784722264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r1v29VLSvgMsUU7R0kEshaMcEhvXE2Ubp0lFFZ+0QM=;
        b=Zf6mN+7DHNubAILedzhomTTLlqlJjaRubQSUbofTmExpe1fZPY/E1S94ftkcwHxTr+
         4x1QLY737oMp8gMlIvqljq4r/cie8gBb78Lk420s4OXtd9sCyJeZPI35Ghu6pvENRmGC
         oPFrmdUgiM7OwPcuhE+mEa+4OA0QUTYsl5GWZpvZcRO47KueVO/Cy9gwxOrQeP1Wj9i/
         ORMwM+wHseVFLK7YU46FEq13jcpVUBtshnRN+n1wqMLr6daYBkG6XQNaB76DMx6WWhVY
         ltcZTWoUaKski/+7PPWYAnGvqjF00Bg4rO7mFKdJORcMFuJmjaIJ7q0lFYSEX9PSlZX1
         LAQg==
X-Forwarded-Encrypted: i=1; AHgh+RqjY3ZdFz0K20mKdKHZcnC3OA8M6VRzuYPkPYUBJXpGV+hTnecLdxBqUDAshf0z0B1KTqd7THbHUxEV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1fps+HVW6jsKGvrms22FVhKQJArQz7ckD5Wc9VqXJlvjO1wh7
	lRUm21VuRRGPCZka1IcbcEw7n4oRdTpc7ID9Mv0+7rjbRPsc8EWudUVdJ8nZETJFhp8jFkjy3dn
	urmvFKtbZkwezmgU+h4OAscNIi8i3ztZVs4sRi2450Fg6AuefYqd5dDm24ylMFC81
X-Gm-Gg: AfdE7clrS0vpiZxJNXp4K3nsOrmwF8AdpemquEh4j52OznEKeMvSfMMiJGPk6o+1Q8U
	EGBkSIKxpCdN+1Kn3LRkniTHMWuKnzFstGinWRwNgd/UXV6NuoUP9zhTYWwlLPY3zcLvb3g5FYv
	RhPNIAoyq2Rk4IHjauzuJ9Ocwzod5mu9UDtqGQZzqZRxqOblEeuNq/VDSNIyIxQzkmX/rZtLLJ1
	H2wtZbB5pdFbJhWKDtG2ahQVXHR9JIu0qnm/n3OfBC3fQJVnc2l+VdFrVX89oU+h03rpzIv4CMs
	YvR7sZUVFIb5iQpHjGSdiSyA02R394jakQL3hGr4QYb18vNGuOHjtvla/ibKYXGpSzTqv7CQ387
	P9+WQCexXjKh4f/mF271DrRguwx5oQxaOK9SyZyw=
X-Received: by 2002:a05:622a:5507:b0:51c:1117:c7c with SMTP id d75a77b69052e-51e4f000f39mr25909021cf.25.1784117463831;
        Wed, 15 Jul 2026 05:11:03 -0700 (PDT)
X-Received: by 2002:a05:622a:5507:b0:51c:1117:c7c with SMTP id d75a77b69052e-51e4f000f39mr25908481cf.25.1784117463188;
        Wed, 15 Jul 2026 05:11:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1716:4a80:ed58:2ab3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508727fc0sm144090395e9.6.2026.07.15.05.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:11:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: wsa+renesas@sang-engineering.com, Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sloppy-logic-analyzer: Fix memory leak in gpio_la_poll_probe()
Date: Wed, 15 Jul 2026 14:11:00 +0200
Message-ID: <178411745748.18502.12174500033984620258.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715075311.527753-1-nihaal@cse.iitm.ac.in>
References: <20260715075311.527753-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMCBTYWx0ZWRfX1H370rpRbfhX
 lTS1FBNruRlLuADEgK94ukV6e6aQwuTImNUMeJ0T+kITRjWrWFhmmb4xskWacFEKYCcRXuODZsh
 xXx/dcEauqt9tR2G8VGiMqByr9EiOzk=
X-Proofpoint-ORIG-GUID: y-Z0gvOQrSisyfa8gCg7UKi3fUYXTdk1
X-Proofpoint-GUID: y-Z0gvOQrSisyfa8gCg7UKi3fUYXTdk1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMCBTYWx0ZWRfX8WuQySEmbwvC
 5YTfEwY1xN+R74MuyB64VpyjLbkM8cG+yMHS1Slpy2pZ1jHJ+T0DtYTY9ebMyX8yP5d2/6eZFoP
 5ojAAkhylEV9Xqhp8QVeW7cczAuPD3VSTV8A5qeFZPPzHmzdjpRgBkP+z+0kbEy3m3+A2k+1NvR
 JZb0ie5Zj6FuxRJ3yF6U/JtURoCEHlO5rsnXFiyUIxzP/YEXohcslsN+SeVkTmWqCIPMCQktiCM
 kNfMhBjlkhkppnKX1gIjyqw6Of5pKhFcAAfkkJQYni84E8XLJZxN59yGRokeR6StdwuNS11uoYQ
 W3vhchsLwADU+SDVB+lVnJRpuBRahUR+FeTxovX98o6ByJlG0JHcWruw4BBDhNxYaJ5SAE6OF9M
 jJfIE2DrvccUL1dKcjQezzKwpLANvb7nHYfrxc7DuoEfsWHewBAgUE4Lnve7NjW6GBTB2CaztsI
 09/ClbS/6QU2/KYygNA==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a5778d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tCoZFv4qA_Vs4i_Yda8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40111-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:nihaal@cse.iitm.ac.in,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BE5675DFB0


On Wed, 15 Jul 2026 13:23:08 +0530, Abdun Nihaal wrote:
> The memory allocated for priv->blob.data is not freed in the error paths
> that follow the fops_buf_size_set() call in gpio_la_poll_probe(), as
> well as in the remove function. Fix that by using device managed action
> to free the memory on remove.
> 
> 

Applied, thanks!

[1/1] gpio: sloppy-logic-analyzer: Fix memory leak in gpio_la_poll_probe()
      https://git.kernel.org/brgl/c/7a7baebd9f23ba4f24796775472b2fd00dcd95d9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

