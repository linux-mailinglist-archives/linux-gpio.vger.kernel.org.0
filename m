Return-Path: <linux-gpio+bounces-32267-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NCJCJdfoWm0sQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32267-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:10:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F31B4F4A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 654E53129DC9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8553C1977;
	Fri, 27 Feb 2026 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpgZYGqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAAcv86F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787A3ACA60
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183307; cv=none; b=jRlnIIgp9kJBI8kLbaucIgA1uVCIvPk2KWwQxwoWsBm6EyQRd7PzTiNf5C3T5eAihOp+/suA+pVdK9+ZTpb+VlsOYj3nmH9BzrWMENbpbQgSFayvGOF87CADJ6W6EeEpPW7yC9umpOOD7M6jEn/uKj0C28rzaTFKh97iampmZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183307; c=relaxed/simple;
	bh=W9/tXbEVoeAbP9JhfEWWy3bLCtLX+Rg3EEuAgwan1bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npO0TfRq6aCqrYz3gsJbgQIPKEMrxq+sMtLzkQqVNn54JTLSKNlgWzmIZ5iu9C8uPNx79R/KU3MIKxCG2pNcbK/zi0q07ql+ElfldBvDL9xcZ+cEC0lsKH2l873bGfzD9lTl9Mo0FHt0uTd9axCBsgihPkpJRHyfprc7tEeV2fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpgZYGqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAAcv86F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K6xN1600867
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI/2H9TQIECKYL2ep32z+bto+nxJK1Q/PShkz7EB0tc=; b=gpgZYGqyQUvGPUVl
	UHS1Sn184coDGXc9wOvzyBrO1gZ64IMuQYFROLduZNClMBx0iGySVvBV9App0w8K
	5doKdprpItp1eVVQgmT6paT1oiR/fIL/LO+2XkoIWY+5+j/bov70LqFIoFBn5dtc
	g7YZ87Bc2pcNtSU0NOqtahsMdO8ZEIzq00SFjO0QjQuI+nseuHH9mpFZ33BmUmDX
	Wdtq6yekWtCRGxTTQDmau9QPAKEKCpBYqO4Nn0SrVyzXEWXj5/aiFKYGnsZb9YRh
	+6nGv51ewMto5+oB9S2oaoPeHfaESE+XecBetlkUp0HFeT6yKWFlKP5xmn7iVopw
	FdL/SA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99txgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:08:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so1522665585a.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 01:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772183305; x=1772788105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI/2H9TQIECKYL2ep32z+bto+nxJK1Q/PShkz7EB0tc=;
        b=dAAcv86FyBXWmv5CbDeEr1a9BISZx3j1npZ2Uir11G+Zk54FxGQd8tBaxt8x4Rx55s
         +CHGNwrYV5Rqt28Ibx3eNiUR6aWd/ZGultPQSO0DDpEfEw3L/VTWFEam+s4yPbY0m+Ab
         87szi7ZBdbagCI0vRg6qDxqt3FUIcVum0HfwFXw2WPSP2n0O1eaiiaD+2UdnJ05mCbo1
         anLiHDOAjG5vjC3YmekA3wmTX5wGv8DSQXt6giJg6iV/lXI0aqC8YXNjbKe4nTgkqT0Z
         ADC5OtX5obA96MtbI0He3wJcLZMSj1iZUXdAdAl0zGvFLwEkerq3QIubpl6TCQMDqfI/
         +Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772183305; x=1772788105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BI/2H9TQIECKYL2ep32z+bto+nxJK1Q/PShkz7EB0tc=;
        b=OI4OG9qVWra0LPjBfwv0mlPhZ2pUAi1o7SirwK4zMQ2l4PVZlBlOv2ByLuGDe2k5J4
         /ukP6+tkdAgie5OH/x81ifQ3ZW5sGsTgoY7Qg3dlXXdZFISpP3NcjYlFbZoPrjVb8gyn
         O2oCjbjSMKv3nggK+p7jj5TcCRsSkqumBYpfkfRrbZgBjhKEMxPXnmH5QXw2/ml3EkXF
         kwdW5bYDGMiXsj2ALaKU5Zp/UQWxnsL60Y/wWcSjSo6Z0cq2/2i8AcLG4dSN3zuX3yiK
         GcgEQgKXHQneXmkm5m3XexE6RPtMlsOJlohvkH+1S2AR+42Gc/X6cWqJz9WTg0yEDJoB
         cnfw==
X-Forwarded-Encrypted: i=1; AJvYcCWdOPUrGWPF/ycHnfy8A4UFf/bRyT/AHc0w6GmA6S9/Lo/5CuqunTEl4Up5TW3WS/UjaiAWomd2eHrJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxToy+ZUhXz4g38U3U0OhWiOlVu4D4dEzyl/X7AA6twX6kNvBJP
	iZYPJBBLTQ4GZ+66z15V4iw+axrQe78afau8uQ6Nn9r4GZoxCKNa2MyGq8dG38x9oYWOVuLzCSw
	vY9OJRDYdSMZeMxs0fdkz5HGcy3jTevShPrKM1Qd8V2659D+187HcerdEGVSTyb4p
X-Gm-Gg: ATEYQzwR163k/PQzlPrTUhz7p4GcCxdTSJAi85A1X12aag1DdPaljSgpEE2HCRe3vyl
	5peCYNTqqANshCVS5CgOOcU3m18yBAbIS+SvWBMyf3bPTjZlcs8ymr5EPEcIMmZn32VpVvVeRiL
	H3OKzKd8DH5sjdvc7GGy7V2W7WnRzl2vdRHH/st/XateurimHj8duUBKVuhns0dQ0VgV/PwYoqV
	AnKi+XRhB+5xoZlgAfrgwgMKKQROsjrNPEsZTGaoqVGEyNEMmxLDHTI5Fwl/uzSN5643IQW9D6r
	Vsm7+OYsXz2sxSRHvZcFhK2+pXT3kqjS07pjblPtqyKAMMSRPglpjousdeJXyQH1vtJVf1/Lo64
	+c8NcegbIgJ5Hr2IDS28DUBx5DBcabTLD9TlHz/d+KMrtnoAmph0=
X-Received: by 2002:a05:620a:29cd:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cbc8d83748mr257619885a.3.1772183304705;
        Fri, 27 Feb 2026 01:08:24 -0800 (PST)
X-Received: by 2002:a05:620a:29cd:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cbc8d83748mr257617385a.3.1772183304230;
        Fri, 27 Feb 2026 01:08:24 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c763e78sm5640945f8f.26.2026.02.27.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:08:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/6] gpio: Refactor and add selftest
Date: Fri, 27 Feb 2026 10:08:20 +0100
Message-ID: <177218313070.8853.10933850528918669165.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
References: <20260223061726.82161-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a15f09 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JFjPEo_ycDqruw3l6ScA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PUfpxkaaAJFKxvAFLd_9zs2f_QJpZToY
X-Proofpoint-ORIG-GUID: PUfpxkaaAJFKxvAFLd_9zs2f_QJpZToY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3OCBTYWx0ZWRfX7snZEgJVrzqo
 f3vDmF3TQlYq9bv3SNdN5HFIRFTeLZXylATOMVl4lM1arbHyjpFF/1Otp1jppAO7Hj11nhYkALR
 h85ULbx0NIC7cXb0Ir33NKn7AEU9AY/uiDxMkvN1c33Z6Nk+lJ3molW6PyY4YOMiysqginWzdbJ
 Va0vaQLhjQNExuDGYevfOhOt+ju3QsGlNz1FKO8qZL1ki/oWyDkFl5rIIvaXpT/Xl/tF/rrykzU
 kRiEMvI6D0zPcn1KRjwc7jR71ktdDyl/2U2wOFDbjb5Js8HAV61vTPwfbNxvAGsU802huIKUr7F
 sJpc1R0Qya82/fK9MOiDZK/cFuyM9War65+NxKWq+3Jh2FZrI0KBLcovx8eUGDgTyqvzfwWh+yB
 OzG7WBxyNdQO3Or0X/8zDQTT/Vo/eUaet18HTui/Fw/Neztweg1JPW+oOfh4SHVaAOe9Kt4Leof
 jToH5FknePLtE8wlnhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32267-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A5F31B4F4A
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 14:17:20 +0800, Tzung-Bi Shih wrote:
> The series is separated from v3 to lessen the burden on the subsequent
> revocable work per suggestion in
> https://lore.kernel.org/all/CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com/.
> 
> The series is based on v7.0-rc1 and applies after
> https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.org.
> 
> [...]

Applied, thanks!

[1/6] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
      https://git.kernel.org/brgl/c/cc11f4ef666fbca02c8a2f11d0184d57e6b75579
[2/6] gpio: Remove redundant check for struct gpio_chip
      https://git.kernel.org/brgl/c/049f71131734c47a6aaca2472273aef2cd17a6d8
[3/6] gpio: sysfs: Remove redundant check for struct gpio_chip
      https://git.kernel.org/brgl/c/395b8e555dfcbab6b28f360e39bd048b2f3e362b
[4/6] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
      https://git.kernel.org/brgl/c/cf674f1a0c9893ee1acef832679562007a94250a
[5/6] gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
      https://git.kernel.org/brgl/c/ee68f18d1f0d943d93070eb8cb05598b8b7f0922
[6/6] selftests: gpio: Add gpio-cdev-uaf tests
      https://git.kernel.org/brgl/c/c7f92042d3f3d4f084794f5314fa10366084179c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

