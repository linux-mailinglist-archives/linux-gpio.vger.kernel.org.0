Return-Path: <linux-gpio+bounces-32803-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLFyGTmRrmlTGQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32803-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:22:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D223614F
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BEC3037E54
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577E737757B;
	Mon,  9 Mar 2026 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JehyFViO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRylOxJs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED637702C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047961; cv=none; b=mQtX4cZ/OxsVMjYOrryhtu4ZI8M6BiCKm6UDpyItqfu+wypgisHBhQNwUPJEMh61yZ7LjZDxl/ar9/8E6MKIbSZAzMLyMoflJ+fpdQuVx/Ifvu5Z6IhJXaKTW6lJZpi5C1RczkaauF7ALdVUE2kq8vTTpN6MWnuHRhNzbLW50nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047961; c=relaxed/simple;
	bh=rXw0PKQ/JRHFjJxR7G28EDqyDuu5wRVtDpXrNizHSiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=teS/nJoh+vE76oM00S4vBtp7bgyzUzyv+w81k/O4J9iGUdpOAEMzUGPrzLXzgTLoTpxJcLF9K9QmDL1VOVsglpCpJaDGoSQAn9sxEnK4JTEnnz/i19qW8RBNfh39kgOPmhov20bVsYOUnpkjVswGLDIe8M/OcBe3Ctx03FLNqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JehyFViO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRylOxJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294sw9e2652539
	for <linux-gpio@vger.kernel.org>; Mon, 9 Mar 2026 09:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMQV8zJUzLCZ5NvBevZ6Khe2SkxCuM1IlpJOknDK/fM=; b=JehyFViO9dY80Tle
	8KEN5W+w3pBMMf8IIWlZFZAITToIUo8UCxwbdaVgcIkLJHkfXZXpyZn7aXnoyrLI
	PQOx+KtaedpSOJvFVcE5mII0cYqTqq2Bn/5vuCPWIqL4N2y8XU/NSvL6xkL6Z261
	bHTPOlwXNant7IKOXu6I1/hHMZxw6FR3rIFUHau0dPn1VfgFOsEoCF0sNyJ8yDrx
	lcQ4oWgFI495C2zU0Ha96SnUpE1uEhBCOvBleiOWH0eDlWqGNFeCcZvLRGFNg0/A
	TL4TOkngRSLbimwtI2uVvjPdmDJTgDR9pg8oButjc7KJ4EcCrsZVM1gT7+i1oYK9
	SJqSgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6fcn30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 09:19:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd409so159612785a.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047958; x=1773652758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMQV8zJUzLCZ5NvBevZ6Khe2SkxCuM1IlpJOknDK/fM=;
        b=jRylOxJsMvj70shD4DRo4S11aC0eWpaTVqeO160zzaa7p4gDmaUK7X0q65dWkIy4Dd
         hUlmAMOx7NV67Yu2N44037VLYnCSUFPKoFYYq/TaRLu5/KjR7K7sBmL1pApxYVLISH57
         hRCRMVg3SlkW0VyuXlJuRjdQKXYiZpIENnzIzwvI3DKEMdZBHIM2iJ/6037cHeeVdSsR
         xxfrHACmzdPAOXke8nCT5VlRs8NvpCpFHJFEHAE6hvEHmpkial6dWy0+WFGLexdlrH3s
         oI5uwYxMSMD1Cs03QwrrRuIwe5N3olehBy8ehqf8WxxmwfzQ7K+XPVuGOjCnMMF5HDAg
         WFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047958; x=1773652758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMQV8zJUzLCZ5NvBevZ6Khe2SkxCuM1IlpJOknDK/fM=;
        b=AZIf9NtRSasPOyop3M8gTYJmDN07s5fXZuDGa8EWSBKmDOQ6mDHx4VqYbnM556lsfh
         lxSalpXP4taOooBkHZv7CRWGLv0jJkrHTOlZmi39tAqzVBx9c81zqz8xyguDV1ClcnJ2
         2+HW7oHZOOKTvJjZ6Iv3J1rV7cR6aqUVkMTNHw4AEDNedcHDqfPVgE2MRGopVi14Y8Bu
         zYu2iJohxVLIbuFMOjjEHsAhkq5W+MyYN0SOX3E5EGXAOMXjdLu4SZkvpQW1Qht0NQhl
         58Im3Sy5uDB4So8iHL3lpDnPU/Sr9HiZ947MZPZMJC7OdNsRaR9VQoJnUB4zYEsvOfdv
         NFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6odmB5lbBDHD5TJbp2wssmBb0bGOr8tdK7cONRzzFxyg1Vj3dBe4rA7V30FyOHB/S5MKBQnTXccla@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84M1Ro2FtFjeelYWo5mG80ktPmUjj5Pyj9IMqmDwHCPCAJ5td
	bFcYXfdqRW++vX+QsuR+h4kDVWBqoHQhAG6yWYnbKr/WsON1hUfvIuAo9r4igep224O7cx9723E
	Wv4GEoNX9TC86USHt0SMkiYxJx5yaeRnXeOPGIAuTD3p2hlEyrBPaSOD4uhWXXSNG
X-Gm-Gg: ATEYQzzvpN7+rQm71BB1+WbVk7HhDvqwFRG6dXuwxZFxkLbBCQAIVVFGzu44d7vbIBb
	CB6CJWKi56fAbBgpxgWjl6fyDqNOg2/0B6PfAxLAyxs/jOZqX1QHZLterx5orBOSjfwlPl3koDS
	VgREzwbzWvqFb8IZP1rbGLZl17upVYdvHqiaZBj/VcZv/RvEdgekbl/CEjW5ev+RaL9nvVLd29K
	gcHTRy5JH+ylWyG4DLqjB+tRHL4MIykvn+POtfWaO6xoU6kQhpb8TRsfw9Q7agrCaw93Pg0MYyu
	WHnbNOShkx2I6I0v5U7ZtLdRqrGBdwtY6twHsjODXD55ZOT2xG8p1xB4IqrXd8tFtdw5WUz4zHq
	X9eui+3j5Naeon2qrLa0s8SubvQpgMvr6mPMWGoKeHDpvzNE/
X-Received: by 2002:a05:620a:4149:b0:8cd:8e8c:205e with SMTP id af79cd13be357-8cd8e8c248emr104431185a.52.1773047958361;
        Mon, 09 Mar 2026 02:19:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:8cd:8e8c:205e with SMTP id af79cd13be357-8cd8e8c248emr104430085a.52.1773047957959;
        Mon, 09 Mar 2026 02:19:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba90:b1dc:5545:17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853252cae1sm150954195e9.3.2026.03.09.02.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:19:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: drop redundant device reference
Date: Mon,  9 Mar 2026 10:19:11 +0100
Message-ID: <177304793357.9428.11946435723679042940.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305124945.10781-1-johan@kernel.org>
References: <20260305124945.10781-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _m-DFL8FlcIZOWUDX3mbSYBCIWOo2Hyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NiBTYWx0ZWRfX/XKjW/jrm1rJ
 7PmJGxKJuC+fflVIQVu0aGxe3Q8MDxG1kyCua93GvYPMpS63VXuVloG6rgnxxJk78TIxDBtvOYL
 ey4xxrbyqnawUqanH/haI0/HLrzPna+2eRgeephiYpXaG1BPqPgnaCCNnBwLsxrh4FN9PneXhNs
 nl9SZJdGSF7H7GPII7kXRlLmD5m9d2MDMMaylsrXZkghziQ3Pcjv2y9zMhq1YjkntIiFJyzeI7P
 Evn//GnaQgjCOI/7Wux3RM9IgoZN/6PrFgWEpEEN7KSetrmVK19rgg4X+TTN0WkAlG3yMocDSBb
 JIuTV1k371HBj0LuiLefMt/cZ+MnJ/j6Kd90eEwQO4Wy325McAcnWrqTCGGed6cAU36fnHSUp5C
 nn7LKJHz2+BWIbjW4tQU46+yT9FmqxaA8sZlmwIsOuZ9ISIAjsH3FtCceZyA3bjtiEVIzlroNV2
 2zIp02o3YJPgpQBI/ww==
X-Proofpoint-GUID: _m-DFL8FlcIZOWUDX3mbSYBCIWOo2Hyz
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69ae9097 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sDMKiceRQFDA1Wk9jXAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090086
X-Rspamd-Queue-Id: C75D223614F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32803-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.958];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 05 Mar 2026 13:49:45 +0100, Johan Hovold wrote:
> Driver core holds a reference to the USB interface and its parent USB
> device while the interface is bound to a driver and there is no need to
> take additional references unless the structures are needed after
> disconnect.
> 
> Drop the redundant device reference to reduce cargo culting, make it
> easier to spot drivers where an extra reference is needed, and reduce
> the risk of memory leaks when drivers fail to release it.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpsse: drop redundant device reference
      https://git.kernel.org/brgl/c/3671411e9073cb06d726dbf10835d158e18f0796

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

