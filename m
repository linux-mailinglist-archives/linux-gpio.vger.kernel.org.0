Return-Path: <linux-gpio+bounces-39104-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dM+pCBxKQmpa4AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39104-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:34:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5A6D8F0F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PXwRrGPz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="g/KpMxkl";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39104-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39104-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63420301F5B6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F19B38D011;
	Mon, 29 Jun 2026 10:34:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF53B8BD1
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:33:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729240; cv=none; b=Mcbr++PmyaopbrP7kEvSXEcGStioxmxAja2xhqDA5jRt3itAMNmFEEd4eP4r88NWvqbIlri1EO2C2seubxTEFIbaDdJU3u3j5V44T9Vmxs6s+scOpKrIjmqiouzcUf2ammx4L/G9jCeUXqm+U9LqY2GQqcLYTWgy2gpS5h7ScpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729240; c=relaxed/simple;
	bh=4Pa3JYbMdb/jT/Bvv9+kskNze2LSga5FiQmDwB0mxLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rd4PeKFHvEnvcY72N5GjUX3yf8DZ0NfaGYeNOqVQyMhE1Q2XowuHZcLtYr+XYRJIs+Ct6D/OsfFY5YQJmSFBtVUBP3or1/Zq5T4/iagwKS0D5ndhY4b7219USPTwqR6/VmklKTRNGmQcbtInv95ssH+RAa0yBAAqjGSP0CP8km8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXwRrGPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/KpMxkl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATZgc2592988
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrX0Rpmms6PSwsUPKkxqciY5+sqCQdRiFFRgRv/dCVU=; b=PXwRrGPzKZ8D7T0E
	wtzhSjY17OMwS5iV4dmM12NRpbg/p7GqRruFFbCPbGvYw6E83xTnTCkq+8RWwwhE
	9cKZ5NIrjjmtTWjXPqvKqP7Z8Es+x+6YE+DCY6tXQVA6QbHqixpEvraX0a28VEBN
	vq3rbnBucqfhyJHXNbtfEWYJMCEbzEAgoURpZt9t33rB271nTK1jz4PiF4AQT1Nj
	dfBQ3bn88GPMn4tTO3COZmKHk5wJ9YZ4y8Npw9/nk020sCcBwL46ekKQeVUkxPiL
	28FoLaBxem5FcoqZ8ira/jtV7SOQSdR4fwTdceg7S6uCcp3CKdD2WjdunZ9IDxeJ
	+khbOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vh7qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:33:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e45453c94so355074685a.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729237; x=1783334037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrX0Rpmms6PSwsUPKkxqciY5+sqCQdRiFFRgRv/dCVU=;
        b=g/KpMxklbHPeTDs3KNE7vWzx+dqSI967Os9Al2kznW7HfL4EY0P4sZCwN6ebrZXIee
         gnqnBIYSGhREwDMxTJhhXroIW1lOmfdSF/T1AWb8xdOMT6cxIqcP1t1LYT8APj5Obrvj
         r7w/49jVEHNckLE716IGRkCZZJ3AdyRDBZe8EAwq2XvJGvA1BeJ3NF5CCG5+QAFkpH+a
         B9sMwjl1bmC/2DnjnLYNX3yzIO4uDzYMmyLRYADT1Z44vd1tthPQHYvvzzmq6fkGAxn/
         BUu2sza1llqW9y0mpYgd4pn/hPve5/vlLeFTFFk1a2llM5Eo6xT2Q9SBGwzsU7tGepUh
         ERxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729237; x=1783334037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jrX0Rpmms6PSwsUPKkxqciY5+sqCQdRiFFRgRv/dCVU=;
        b=tV/58U4t+uQz+PjpnzQzcMh8AvKmAseViIbRJVJBGOpbiAituKz4mJ2E49aB4xtdWv
         6QyZ/tg1rwdMTYXD95bJtMdWGS6ByLKSuUW4TEyZ/xKIabPUV4GT2+lxFalFtKMTqG2V
         2gy23UKLP9QSUmsUHwv9tmMVxoV5C/F0XQ0lCFJ7S+Y9FeFPkX57r5AE+pZ99sxcPEM9
         AC2FcLWzszq/RR+5RWURiu8rlP+nOTtITMDeD+vk3uiFH8vVYjQ/lENUF9052ReU+pnH
         Vm5suAt1HCE6WoA9OH3sm9/0hw+2NSkb60GIezMiWiG/z2cHXNgN9LR0wB8totYL7b2G
         2Ghg==
X-Forwarded-Encrypted: i=1; AFNElJ+co38kfrItDxKqa/NFdI4G5Eq/5Be9c0sdu5UMNtKCxLFcxXtDKqkZvfw0mH7EANxjV6WZrG8o2QPu@vger.kernel.org
X-Gm-Message-State: AOJu0YzxK4egi9Ou4ZGA4z1daFrvv1R8RCR6uv2zrRMKokvDlP+maT4J
	xHe5I0cML5rtvZI3DwWpul/FSUhOZOxRu91zd4rheXO5nrJhgPxsZEIVGDVQHy1WW14gLJO0n5O
	wD54nSYsk0VZNxyJXN+B61MEoZ/ub2wRZ1TweSTgOm/qHYVxRbETiijBUEZPURAzUk5B6j/03sb
	k=
X-Gm-Gg: AfdE7cmkSr2aGFX5B2OAjB/iATkYQJuycPNJ6u8mrL0Ucb09H4WRN1sKTxvST+MWDOM
	e6/k1C4BFpKchl5tpGW3DE2zo15aFpsNio+E0cVjfW99x6zs0VWsw0Y/3jLSaWZGmk7eSA1xeuR
	1Uhd1u9XS5RI25gzZ4haGz8OWlQb8JoamxpecOd3fPcBTDmgbpcN6cbHE4aaEOE/RX6r+zM7cDl
	8Hm+UDImNVLR/aGfex6tIQyBhTD82yJ0HNjr/oA7nlgSoROluvVk/9Px+2Td1khcFZiYakj/Hh5
	0kZ136oiLrrmp/5LyG3imrgj20e13c0NGP709QZmQfjHmnNfa3vSp24l7xtjZWztoIyuuwEcfAP
	wZ0QNm11SHLDsdCQ5gjz6nUPKQBj9Sxrol82JcIo=
X-Received: by 2002:a05:620a:44cd:b0:92e:46cd:72a4 with SMTP id af79cd13be357-92e46cd7423mr753340885a.15.1782729237452;
        Mon, 29 Jun 2026 03:33:57 -0700 (PDT)
X-Received: by 2002:a05:620a:44cd:b0:92e:46cd:72a4 with SMTP id af79cd13be357-92e46cd7423mr753338085a.15.1782729237036;
        Mon, 29 Jun 2026 03:33:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269071e49sm311142315e9.10.2026.06.29.03.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:33:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Tj <tj.iam.tj@proton.me>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: amd-fch: switch to guard() notation
Date: Mon, 29 Jun 2026 12:33:54 +0200
Message-ID: <178272923154.13867.11024768540159322885.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aZarCgDvMUta4Viq@google.com>
References: <aZarCgDvMUta4Viq@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r7Wdx_jb5709aZMvDrat4dAbKzLmrVqJ
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a424a16 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IssuRAtz-sYYDyTcao0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX27gjp0nB5OMx
 uHxp5L6q592Ug/5dgkpZ1gR1OI0CD3ocJwI6EJOnzRnecYudIQmJQ1l2gD9XKPRBMUL5KVOWK6I
 iG7npWLAevZlgexYSxNNG7TFtnm/Jtg=
X-Proofpoint-ORIG-GUID: r7Wdx_jb5709aZMvDrat4dAbKzLmrVqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX+NigmPpMg1W8
 fD+0gD9CFz2QJAtP+XzL5M18c0YnrVjspPEE5IPHOrZFjJh/J3uAh0oeProDOks8u3GVMaSvQwq
 q6tonruLkN0Wnl6aR6vvue5Bgr0m9JI2AC1cpF4Hxs/3HfGUhr5211TtlU+kfDW3XYdamrv4wt+
 roeV/ds1+hf0Ot+L/TTssuqhZSAKVhT8LV233rjZtje1MuBolRlCuVZP4r1zFkJEGTxTdSMdzp6
 jILLb4a31/uAiyJJamKhH4haPuO4rnOM1HF+rXFcGYS9R8qvsQ9TQZUiIILmqRb2z2iGyFVWCz5
 ZXu4HwZ95znqEI+fbmZDxfbr1NLSr1KmiiA/BRcTuPfQ7fBpD0UPPlBT+QcvQXhOik31Ok5bXp4
 gADgFJw6q/lHpOeywHagBe9NAP5rbkZummpoxIFQlYoRjJ3pshK2xz3kg1kevXEOzf9is2ccVOW
 mqY1uGV7WBcnXaBXfJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39104-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:tj.iam.tj@proton.me,m:info@metux.net,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BA5A6D8F0F


On Wed, 18 Feb 2026 22:46:01 -0800, Dmitry Torokhov wrote:
> guard() is more concise and ensures that lock is released at the end of
> the scope.
> 
> 

Applied, thanks!

[1/1] gpio: amd-fch: switch to guard() notation
      https://git.kernel.org/brgl/c/45bd4e25f81f3afb550f04376a54f4c5e1d5ab11

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

