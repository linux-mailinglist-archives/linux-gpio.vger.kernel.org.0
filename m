Return-Path: <linux-gpio+bounces-31116-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI+VIueAeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31116-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:09:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9AA91838
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B640C3009089
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57543334C2C;
	Tue, 27 Jan 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVbXKfpC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuEN7EzS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8320233372D
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504975; cv=none; b=b+yJTtaSdMJNfZH/6Sy5C/F/XVl5jV9aXTNcvC6IsmSNzn4eAIkgg0pU5NJzjSRfL3bYmqREvhG7YtZ1pusM7QE0zM3rp9gjn2ONM2okRCidjuS5xEhURyo8JbXX/qFiQwVMS1e+6VJRtJRb1+C+MqvC28i9zXLt6g3Aa4Fl4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504975; c=relaxed/simple;
	bh=vBxG5RDxo3M2CelAyi66+f+v8Jpm8sCpG7uJTouI8eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3mBcbORJzxKvaeiibLvsOmIMwTIsNw5dANF509PJa2xLohSjjXZRIm5PGUZ45ahsaCB2c57OzSuovfK6TCs0EtpZNnAWPgHmJHZlJe8KrWn2Qj2F+HSlHlmlAdbfx2C5oN3Va+ZBnx4zBa3DrQsUCCF+5BmG8BXI8fQzAfGlvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVbXKfpC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuEN7EzS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UD4b496005
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGOdsBQK34H/OR977ehhBWPGuUMyto65cOXjh8VO3OI=; b=aVbXKfpCn1GE9UQ+
	t0h/fGfCjtFOV5V7khv4wbU9CB0ZpjQNMpX756YjipeOP/hcNBPRZVBIzu/Q2Yxp
	5+i8TNWapEHjVnCET5KWstdVH3wMaxqt0cjFkYUZ3izWl6cg2yoJ6/uTHKarx7mA
	7QucXueG2XSjH7pWeNxocC9swXlRayCoNwBjI89pnjOkb3ZPhS/pNsDQInh3dBqA
	uN0fA2CA4iQsMf4WgdqI5xz34Q0FXtd3S2d4Z9G7Kx1fn6mVOR7ipx98koKX2e/1
	gj3v846hspl1XEsXbTrb9GzxTAdR761pgx5JwjLpMvhHA7wFZccl3t2RTSJAJt/e
	tdfodQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bj30u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b4058909so1269511985a.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769504972; x=1770109772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGOdsBQK34H/OR977ehhBWPGuUMyto65cOXjh8VO3OI=;
        b=XuEN7EzSOYHBPffGLquSqAqdB0kGXbb+k05VlyaZ+ipW72wL3T6K03PUvZQznYFeBH
         Go/P/rdI0bU7vprb1M02pKx5/iBM+M0NKezriwHkbnbvwwkyWdXqdiwGNd3M5UVh0TCV
         nSSALb+BMc76JO+h7GOyGgpBVtxmGug6suTIQt2gYdinEDV2DxTBsWdyO4XSlCKCChOE
         /T5FdfK0GWKg7zhlc0fTp0QRvM3gxxm7X7LVMT6aEw15/v5kMdQCGbdvGHaYfW+OMH0a
         2zWF8KkpYeeJp57Q2+5s+FOdCPy1PCGlQs4HYodS+l/G6hnpWnTqjHQT2ay3pkAN3j7b
         gAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504972; x=1770109772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGOdsBQK34H/OR977ehhBWPGuUMyto65cOXjh8VO3OI=;
        b=vGoz94N9+bLptHHBb+Sn+ym/LRhBsENti/3vzorU97F1ywAsn7T02WiPQVLMV8nnWW
         2xKSOqKBAtS4V8Y4KqPxKksUAjDkCuIQZPZlZijbOKaIqeFPxskctqNBYEaCr9NplgOm
         Qeqn+Q59B5xhOydF4SKt02Th6foNoS6dGLY/YgxaI0YhaFvPRJCaCwwoFDhdy5wcrPIP
         /tmKtiaUCniXco3SYM/KurRzPSnnq+cRFib7swatiNOLySd89bYn85enLT70BZ2yLR3T
         XqCYzg75Rrd/Q1BCaR5hX7JKDGG77uFZ4oTMDwdGBnjRvpTlSMgSLToDnbRIuIePe7zC
         8log==
X-Forwarded-Encrypted: i=1; AJvYcCUPXCrsmVlfa8O0HIe5fg8/QRHArlEN/xWEqaztFQnSPoEIHzLehrmA/taAnFe0AzRabxhi58GZYyAG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vrp3bGe5/6M5n+E3vzkCulrxkS3wDZ6T1a2Czk4EdHLgWVzh
	Ny5K7gQ7clclFQonlxjJK+NJOLYcYRUjgDBbZuSbWKqrsscSMMkOV9MTfEapzVu3IgvLb/fF8QT
	wvwM20/z9Do8buRcWNGdW4PikHZnltUVA4NKDBOAGPSJdnczFCzyWTHsh6F1vSEaN
X-Gm-Gg: AZuq6aK1g75rG1cpXF/HFcYPfDkkDFBBmSwXGCT4AOqqrBy2/LHW2JrAa1WXkCSBqpp
	f0tI8ozhR69bXvySDOC/CbAYk6hbcWQYkKh7lrscPKMVt31J7NQw3u4DSFV4+U0SGHApyP0+BKH
	9uunYtxWWj0srdSUONPGd2UN0smy9Yrp316v7kbunlHk7VW49xR7oF+wltw8Q/l+aXbVdyDtkrF
	ihKqrhzCym+ecScLw1L3x+UYOoMDd95lQXI3kv+LpDH3GrjK9FCXRkH4q2ykTosav7ML0NkWxB1
	470mSpxQ7nJmO22F8ZKgbPRcT2kNaMf5SjAxJEf/m2cqxNOyp/EhuJJXknIYmyrqzca0KsNVMHu
	4Yd6eRZ2p8AXDxAhu6sCCJobKVJTX1Qz4h+UQ8w==
X-Received: by 2002:a05:620a:450c:b0:8b2:db27:4262 with SMTP id af79cd13be357-8c70b919056mr104369485a.74.1769504971804;
        Tue, 27 Jan 2026 01:09:31 -0800 (PST)
X-Received: by 2002:a05:620a:450c:b0:8b2:db27:4262 with SMTP id af79cd13be357-8c70b919056mr104366885a.74.1769504971385;
        Tue, 27 Jan 2026 01:09:31 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db7b434sm128163345e9.4.2026.01.27.01.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:09:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        Xuewen Yan <xuewen.yan@unisoc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, ke.wang@unisoc.com,
        wenhua.lin@unisoc.com, xuewen.yan94@gmail.com
Subject: Re: [PATCH] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
Date: Tue, 27 Jan 2026 10:09:19 +0100
Message-ID: <176950495238.13307.5466333816123432265.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126094209.9855-1-xuewen.yan@unisoc.com>
References: <20260126094209.9855-1-xuewen.yan@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IfBbNswpXAnQj6Slr-AKzCzFscuau9uP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NCBTYWx0ZWRfX2OmeYjEKtv8/
 Uqu4pPLjySU+afydZPqwi2+hDZ6LNF0bKNQYLSy72cN0q1BedkOqlVu1PlBZyWsjUDe/aecryuH
 lh30zFVTcsaAxyAZBsDIhbxUVZpD1P+Q0onzeHK+jQ0T2OA89qgFwwoMzqRA7Lox7ihPnh+MqV0
 uI6j58XxJQl0gZrPwv23x3ZVuIgd/URARcuZnaeWV1rVLLv/C0NMAg5rupp98Qe3leeUpwI05DR
 MshkmtffqsNuAQIHpG81tJPQw3A9/AU2bI2BaPbSasEYgQFoOZznMcP27srgg2873yfvM1ZZqqE
 1F0E/y5T5XbNlMiP3kTfVglmF5TsVFVyKkp87XjG18v1sIE4k1aRoNG37b3d0rukcZMMM/6V11o
 AkPuZCXUJptLkokgyVZaJlJf/9kdUuk0Z1l82qiC+EOqNJBMA0HjP+P3KrHyuLcNY1sUuuIZtKg
 k7Tq/1a+kGCCAfZ8WXw==
X-Proofpoint-GUID: IfBbNswpXAnQj6Slr-AKzCzFscuau9uP
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=697880cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EoAGHgS3sxU27ly2rhAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31116-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linux.alibaba.com,unisoc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linutronix.de,kernel.org,goodmis.org,vger.kernel.org,lists.linux.dev,unisoc.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,c6:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D9AA91838
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 17:42:09 +0800, Xuewen Yan wrote:
> There was a lockdep warning in sprd_gpio:
> 
> [    6.258269][T329@C6] [ BUG: Invalid wait context ]
> [    6.258270][T329@C6] 6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 Tainted: G        W  OE
> [    6.258272][T329@C6] -----------------------------
> [    6.258273][T329@C6] modprobe/329 is trying to lock:
> [    6.258275][T329@C6] ffffff8081c91690 (&sprd_gpio->lock){....}-{3:3}, at: sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd]
> [    6.258282][T329@C6] other info that might help us debug this:
> [    6.258283][T329@C6] context-{5:5}
> [    6.258285][T329@C6] 3 locks held by modprobe/329:
> [    6.258286][T329@C6]  #0: ffffff808baca108 (&dev->mutex){....}-{4:4}, at: __driver_attach+0xc4/0x204
> [    6.258295][T329@C6]  #1: ffffff80965e7240 (request_class#4){+.+.}-{4:4}, at: __setup_irq+0x1cc/0x82c
> [    6.258304][T329@C6]  #2: ffffff80965e70c8 (lock_class#4){....}-{2:2}, at: __setup_irq+0x21c/0x82c
> [    6.258313][T329@C6] stack backtrace:
> [    6.258314][T329@C6] CPU: 6 UID: 0 PID: 329 Comm: modprobe Tainted: G        W  OE       6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 PREEMPT  3ad5b0f45741a16e5838da790706e16ceb6717df
> [    6.258316][T329@C6] Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
> [    6.258317][T329@C6] Hardware name: Unisoc UMS9632-base Board (DT)
> [    6.258318][T329@C6] Call trace:
> [    6.258318][T329@C6]  show_stack+0x20/0x30 (C)
> [    6.258321][T329@C6]  __dump_stack+0x28/0x3c
> [    6.258324][T329@C6]  dump_stack_lvl+0xac/0xf0
> [    6.258326][T329@C6]  dump_stack+0x18/0x3c
> [    6.258329][T329@C6]  __lock_acquire+0x824/0x2c28
> [    6.258331][T329@C6]  lock_acquire+0x148/0x2cc
> [    6.258333][T329@C6]  _raw_spin_lock_irqsave+0x6c/0xb4
> [    6.258334][T329@C6]  sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd 814535e93c6d8e0853c45c02eab0fa88a9da6487]
> [    6.258337][T329@C6]  irq_startup+0x238/0x350
> [    6.258340][T329@C6]  __setup_irq+0x504/0x82c
> [    6.258342][T329@C6]  request_threaded_irq+0x118/0x184
> [    6.258344][T329@C6]  devm_request_threaded_irq+0x94/0x120
> [    6.258347][T329@C6]  sc8546_init_irq+0x114/0x170 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
> [    6.258352][T329@C6]  sc8546_charger_probe+0x53c/0x5a0 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
> [    6.258358][T329@C6]  i2c_device_probe+0x2c8/0x350
> [    6.258361][T329@C6]  really_probe+0x1a8/0x46c
> [    6.258363][T329@C6]  __driver_probe_device+0xa4/0x10c
> [    6.258366][T329@C6]  driver_probe_device+0x44/0x1b4
> [    6.258369][T329@C6]  __driver_attach+0xd0/0x204
> [    6.258371][T329@C6]  bus_for_each_dev+0x10c/0x168
> [    6.258373][T329@C6]  driver_attach+0x2c/0x3c
> [    6.258376][T329@C6]  bus_add_driver+0x154/0x29c
> [    6.258378][T329@C6]  driver_register+0x70/0x10c
> [    6.258381][T329@C6]  i2c_register_driver+0x48/0xc8
> [    6.258384][T329@C6]  init_module+0x28/0xfd8 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
> [    6.258389][T329@C6]  do_one_initcall+0x128/0x42c
> [    6.258392][T329@C6]  do_init_module+0x60/0x254
> [    6.258395][T329@C6]  load_module+0x1054/0x1220
> [    6.258397][T329@C6]  __arm64_sys_finit_module+0x240/0x35c
> [    6.258400][T329@C6]  invoke_syscall+0x60/0xec
> [    6.258402][T329@C6]  el0_svc_common+0xb0/0xe4
> [    6.258405][T329@C6]  do_el0_svc+0x24/0x30
> [    6.258407][T329@C6]  el0_svc+0x54/0x1c4
> [    6.258409][T329@C6]  el0t_64_sync_handler+0x68/0xdc
> [    6.258411][T329@C6]  el0t_64_sync+0x1c4/0x1c8
> 
> [...]

Applied, thanks!

[1/1] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
      commit: 62c7b1d6aa8b287c7554dd9abd3503fe4883e50e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

