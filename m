Return-Path: <linux-gpio+bounces-12192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11D9B284F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 08:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4252A2821E2
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 07:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1961B18E374;
	Mon, 28 Oct 2024 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jNU4vMaD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC0188A0C;
	Mon, 28 Oct 2024 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730098886; cv=none; b=SjaigzEiQxGlmy6ZLeV5GWgIoYdWRE23BbDPNdgm2xSKPedYtGqkhYOrxKRh7dhcwyL1ceZjZNvgJzg8hLP0g2NitRYIvZU9625V9WpJs3x/grBowX/4dhBSRsAZHqXTTT7zno4G5xcplA2w1hWjTMd6DASwlqDxp9kHNGYict8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730098886; c=relaxed/simple;
	bh=FfoPa6/6/OVg074CvJOOL6D1mOf8YdQys/StpDozcp0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8AMn16pr/VHOlyLjskU9Mnqm/cwYxSSWPRjUsaqu+OuNhA917XbjRF4QZLo4UbawOsUTLhLWXayqYcxxhRQQxB7w21KhCV7bTy/4YB4YDU01DoLdbLXIf1rUu8dd8uzpMwo5K6ozWF/shfRL4R3cd3tkb6pq7uxbMkIDfVG+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jNU4vMaD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNTDrk021444;
	Mon, 28 Oct 2024 07:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WcmbJeBrTwvfTreVs6DQP1dUIX+1qgHcjchqIFOcgCM=; b=jNU4vMaDLoH88K9F
	I1BWamvySuiZJeSCVYu8uQAeqrr7hm6IBjfaVnh6rsbsz85+bDXSi+1JBHVCA0j1
	3WlEZKcb4CxgoEnDCUdriOl9RzHhW/06FqZQAMR0tn0UJypuwntjtzV1utpeP+kh
	voDm2sSYOiPePVumayQ8VIXuV+bSA0UzOR47vnzz+jpZDBDvUYQiil9IM0h/tXbW
	wb3+whzJURduf2O/vt9MWAdsXTUUopJdHmrzDXmDb5Cs1bIITHSKxG0vn8u8SI3z
	fzDj60lRyM31MXiLErSibzTB3xzjJsFsPKlGpPuTLeGcfJKXuAvnbG1LmQq9hqxk
	P98H2w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gnsmm4jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:01:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S71L78005554
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:01:21 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 00:01:19 -0700
Date: Mon, 28 Oct 2024 12:31:16 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] pinmux: Use sequential access to access desc->pinmux
 data
Message-ID: <Zx82vLyD1JMv4Cx6@hu-mojha-hyd.qualcomm.com>
References: <20241014192930.1539673-1-quic_mojha@quicinc.com>
 <CACRpkdaAVE8VMNCFA4jQ1+YLuC9=4mc9Bp2PRxeNFQoHB+NJrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaAVE8VMNCFA4jQ1+YLuC9=4mc9Bp2PRxeNFQoHB+NJrA@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JYuiJxFci38jkxnwu2ohsY7I2s2GI6PZ
X-Proofpoint-GUID: JYuiJxFci38jkxnwu2ohsY7I2s2GI6PZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=957 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280057

On Wed, Oct 23, 2024 at 12:00:48PM +0200, Linus Walleij wrote:
> Hi Mukesh,
> 
> On Mon, Oct 14, 2024 at 9:29 PM Mukesh Ojha <quic_mojha@quicinc.com> wrote:
> 
> > When two client of the same gpio call pinctrl_select_state() for the
> > same functionality, we are seeing NULL pointer issue while accessing
> > desc->mux_owner.
> >
> > Let's say two processes A, B executing in pin_request() for the same pin
> > and process A updates the desc->mux_usecount but not yet updated the
> > desc->mux_owner while process B see the desc->mux_usecount which got
> > updated by A path and further executes strcmp and while accessing
> > desc->mux_owner it crashes with NULL pointer.
> >
> > Serialize the access to mux related setting with a mutex lock.
> >
> >         cpu0 (process A)                        cpu1(process B)
> >
> > pinctrl_select_state() {                  pinctrl_select_state() {
> >   pin_request() {                               pin_request() {
> >   ...
> >                                                  ....
> >     } else {
> >          desc->mux_usecount++;
> >                                                 desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
> >
> >          if (desc->mux_usecount > 1)
> >                return 0;
> >          desc->mux_owner = owner;
> >
> >   }                                             }
> >
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> 
> Sorry for taking so long!
> 
> I was turning the patch over in my head for the fear that something will
> regress but I can only conclude that we need to test this in-tree, so
> patch applied so we can get some rotation and boot tests in linux-next!

Thanks for queuing.

How to check if this has passed the criteria and not regressing anything ?
Sorry, I have not subscribed to linux-next mailing list to get
regular update.

-Mukesh

> 
> Yours,
> Linus Walleij

