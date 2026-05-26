Return-Path: <linux-gpio+bounces-37494-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLwuKiRbFWp7UgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37494-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:34:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A455D2806
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDBC63023D81
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB663CC7FE;
	Tue, 26 May 2026 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSFLpdkJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqCGE/KC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CF3911B8
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784472; cv=none; b=fK8D6YpbrtyhRxec7M4cEFfFr2M1MNWCVlBjE+w0g32TM8wpksXNTEYXmIR3yNvKn+WH9k1z2dOTKWsjskE0kfDL5/GsOx46jf+cywPgBKM2FwtfCcyKPfPbHF4jseCbX/BMP2ZdN6RWCpBPGfy7lxayva8QTh7oln4DsFhOx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784472; c=relaxed/simple;
	bh=r0V5PDc0tAB3YdalBAkHscENpcgskMZKfwJi2KAAaig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpsZyMFi+yXY7ErBWLcQIVe8iPBeBxUt5x44NpOS/pRkLOt1JC0FIG4nGScPCD7UrhAVG78N9nB2PvQhTPHuE6wIvEKXvEzJDuxd/kj+oqlfHvuWS+K+GZzy/AwBRkluG3Pbcs6fsAjSFOdSyOmZR3bnV6yGT3XkICgTn8gzM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSFLpdkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqCGE/KC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8K3Ei4117449
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tl88GlS8D1gVY09CHUPoKRipf/qb9KLr/K7ftvfo4oY=; b=MSFLpdkJx7ps3G2L
	OkjSLTVz4ZIESBqc6sYGG4xY1pfLPLv0WHkJQOLQp35aYwXSV6IHwbXI0iN3L4hV
	3D8qWTfJ9+kAjmBfpfc1xYTChCpNj9jTauPHcHbBzTA53j3ao8ruryZxIFX0r22N
	1S9XmEQUyuj8vXKzbniUyy9ZNqvHxNKoU3YS85bJlmXvr56HiI67IHRK4RbrQRr+
	Wgp625ZjkO5s9cYxNmVu50d4+Hy/yulTepVyxXenvzF2nM69dilN0yr0R44jg8gp
	TTYguub6uaop0Gh8kbCyGXmlI0swJIEDntTHkLA6liGcLuhxZX9V0rOFtKbMpnuM
	cTApBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecquday7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b673c8f1so61586481cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784470; x=1780389270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl88GlS8D1gVY09CHUPoKRipf/qb9KLr/K7ftvfo4oY=;
        b=VqCGE/KCANeiqkV8TjKv1Ib1eByKWm0/wha4FtffSl3PtDcfNqs1dEN/WS6rNv3ZD1
         ILcgm6prrr/tU/xYUK8KzeLqYgplZCYwIpeWRxR18eWklIajxvjSoQtWLd7Ks4pLgBJG
         NQSnXrQoueXR+L6kd4WWNP2pA8Ma+87GsY4o1Fcpfa9UeUEUpGI61QzrKUgVA9BMps5q
         2W+OY4dVwqj6Uv970SdeQxzcvK6cZKNW9Rmm6p8HxYe9bUUG3kOOX89sU2ft4xbrB75O
         yE3+k5W9G8WOk7MbxzYL23YMx+1w3SQFYJFPjr842DMkmF4TCiL8dRDVYgBwfsu2xT21
         iOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784470; x=1780389270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tl88GlS8D1gVY09CHUPoKRipf/qb9KLr/K7ftvfo4oY=;
        b=L2VJcjqFdPoohu+jM9a6lnwR+vhIjrzzlHulm013lqoEDsKTSA0k4jDHqGbrX1VJML
         NJ7iVdg0uP1Sask5D+ClT4e0azBZWw+BGMSWqPigS9/L5eyapT3A84M8DfMLZks3Jeqd
         csKJMiCITtb5TXAKWuprQn3LJZsn28SofYXQxHQLtboiSktmW5u+ooTZoZkAJV1np1Fk
         0qlQ2LKflkonZHvEdLuN0RmG3+nKncsooAnY3WDSg6K3BSqZ4Vt6t36a809lSZ7MS0Dd
         hKABZ0kMpp7vKYEocxqNffFL5GSOCVe4FOzNRQYdfh9WrghPaLRw9t8FDXq6TUT//gPs
         9i8g==
X-Forwarded-Encrypted: i=1; AFNElJ9StAVpc5K7h/c5S67Z20FFMm1cH8lAK8kctuBL5I9jAymKnYZ4O6sD+cZguERQDuqN643UhHQiDeN7@vger.kernel.org
X-Gm-Message-State: AOJu0YxknvP2cEuXZ8L5ILji0sSOiEv8lvdARRc2jUTEgJOQF4kWc1b6
	6KGhtl00y/DnFinXiJUIZaprBLYstzJvi5d+HFfWFqLx2lj8FnPaZWvmIJ/ZQevVD0lbwjpxq6E
	Szb8ZBW2Y4jniZNyFLIoEE4SyrCKVj84NONzJCWDj6MlKeJ/VzqqliGHKlRKVUVkU
X-Gm-Gg: Acq92OF8CP452xsknrnTX0FIfV89wXbrsNcAnF6YiIfsdsm2FyHU+5xVGEa7u0EUJST
	9IzDJypVZ/JQtNR482X0ZAJSCXr5qagZ4KjPQDFe6KSjhoinWPFpdkgw0aIHc7TtiU35axdpPT4
	D+4Bd1xEaZzb6MQV9u32HYZccDAmbig0Dqt49zr0kYgglhNY4z+Inj1kYF6ThaNuuOqM1YdZ5j2
	Jmzl9+qt9MX5p/3Q1qot+nxy8f3q4u/AHZ7DGjR3Na7kcU54WmRc+S5Rhuj1X7ws9gdtKpvUgLV
	9Lb9rfkBAqO2Jhs4g4YPL9dyeIIj2EtyPTxwAStiHG8JLfptX2sd/BUa70sa4Q6kA32tzekcWCk
	wBI3nqV3LF7rSCBw/oNNFR4d5LIIhQy1S3pVhVPHP58bS/OKkx86fuQwZtfZ1
X-Received: by 2002:ac8:5a03:0:b0:509:3940:30ea with SMTP id d75a77b69052e-516d46421b3mr234437971cf.55.1779784469767;
        Tue, 26 May 2026 01:34:29 -0700 (PDT)
X-Received: by 2002:ac8:5a03:0:b0:509:3940:30ea with SMTP id d75a77b69052e-516d46421b3mr234437801cf.55.1779784469368;
        Tue, 26 May 2026 01:34:29 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm92904325e9.10.2026.05.26.01.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:34:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Dan Carpenter <error27@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: Fix uninitialized data bug in gpio_virtuser_direction_do_write()
Date: Tue, 26 May 2026 10:34:19 +0200
Message-ID: <177978444195.19212.8380742657499672783.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ahP3BJWWy-m_qI0X@stanley.mountain>
References: <ahP3BJWWy-m_qI0X@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jmNXqBv83SsiEAQmox9ubnL4YbURFacQ
X-Proofpoint-GUID: jmNXqBv83SsiEAQmox9ubnL4YbURFacQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfXw8kNIc8bOW2Y
 eOBRWMHaZu57arf4h8VN95CJvV9NCUm5a0l4GEehoz95poFGmo1V2dge59SYsk+bWV41y3Rioh9
 hFjsbC4UqxUn+pc9ne5GKsnpkBbl9g5vMqBBz5RHLdAI5M3pQGU33Q9Fqzu+r+uxEQzMGavReBK
 7BfeHzO1QwRUhBT6pkvP32Th1LdhbLdpN+JNuSBOXrPvEmEIgJMVQzuljKzr5inoVz3RhSSIzP4
 HDw3YzaBPe/11auOoBYlIxiDUjtxJt53x3LnqDCPqzzaJ6iK2VIz5NDcghkOTWs8RKcGcl/yOuO
 fzxM0O0od62vo/EcVcQaZQtXtRSLNskSsm+5i9HRusgL/le1aNrb5Opd5VCLBQMJyNVeNPf5U3D
 ltRJjOxDgF0/aaFv/qDTM/Xo/CgPF1I9p4SF7AywcOgkSMVvcw1RblbSSckzB/66J3PiXbgB3I1
 fpHOBmwbpYP7nYRXoXA==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a155b16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kcc5haGlxQAlbyrUhMAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37494-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14A455D2806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 25 May 2026 10:15:16 +0300, Dan Carpenter wrote:
> If *ppos is non-zero then simple_write_to_buffer() won't initialize the
> start of the buffer.  Really, non-zero values for *ppos aren't going to
> work at all.  Check for that return -EINVAL at the start of the function.
> 
> 

I tweaked the commit message a bit for clarity, thanks.

[1/1] gpio: virtuser: Fix uninitialized data bug in gpio_virtuser_direction_do_write()
      https://git.kernel.org/brgl/c/39785f2b3e9fb8f3375dde1e3e4c94ff953871af

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

