Return-Path: <linux-gpio+bounces-842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE0800EA6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D20F28100D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 15:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F3E4AF72;
	Fri,  1 Dec 2023 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EKGMR8Zx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0022C194;
	Fri,  1 Dec 2023 07:34:53 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1CCNJD031400;
	Fri, 1 Dec 2023 15:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0ZklXZgMgNVIXFADu1Td3CAYvg3iYt75Ybl27HxE12c=;
 b=EKGMR8Zx1hwG/PNhEmIVoxqRqsdQkOuja1cf7g9k48SdbbLfHpGhNUo8My422KnrluIS
 nsoseuycJcNaPcA/IC9KRLzPwdhhziMADIwxRkxCLvzHEMmjQRc6fI2Z2mXEvvZ0rlDd
 lwnJcafO7mJ5kEV/h/gJVbv7E7AQHjroXxteozzFdS4j/nh9/KPsL2wrN50GRPyLgYNc
 nBUrAgSWZex1rM7Q8Is56gqCAmZYZ3d8sWEw31G6DcaD2P5E3NhtOMwwzto8uJRSSX5u
 Mw9WGNhOHBMDURlnY31SqhJ9NgjfI8rFZcb/rMntp8eO9JBNaxHhadNQIBHjwC/+Km2N Bw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq6dkssbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 15:34:46 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1FYjdP009513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 15:34:45 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 07:34:43 -0800
Message-ID: <e011b3e9-7c09-4214-8e9c-90e12c38bbaa@quicinc.com>
Date: Fri, 1 Dec 2023 23:34:40 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Pin control fixes for v6.7
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Chester Lin <clin@suse.com>
References: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
 <CAHk-=whk4oNQazgpzkujc2=ntVQMhU5ko7Canp2Uuq6CpyGzmA@mail.gmail.com>
 <CACRpkdZRf7bNVmJCgsVD0uheD1VLkLKG13d1oS-kbT8BFyRKQw@mail.gmail.com>
 <e703c87e-32b9-4dce-b232-89c0e909c35e@quicinc.com>
 <CACRpkdZtCxwLZCY4autrTvonmZ3XcVzH6iXqXanS97VKCZ+ERw@mail.gmail.com>
 <9714f76f-0cf3-4f54-8e0d-fe3ca2990eed@quicinc.com>
In-Reply-To: <9714f76f-0cf3-4f54-8e0d-fe3ca2990eed@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 27hOuwpan4iuFUsE4ei40XA481AewGt6
X-Proofpoint-GUID: 27hOuwpan4iuFUsE4ei40XA481AewGt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_13,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=958 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010108

On 12/1/2023 6:06 PM, Aiqun(Maria) Yu wrote:
> On 12/1/2023 4:10 PM, Linus Walleij wrote:
>> Hi Nathan, Nick,
>>
>> (just picking some LLVM compiler people I know of... and trust)
>>
>> Context is this patch:
>> https://lore.kernel.org/linux-gpio/20231115102824.23727-1-quic_aiquny@quicinc.com/
>>
>> On Thu, Nov 30, 2023 at 6:37 AM Aiqun(Maria) Yu 
>> <quic_aiquny@quicinc.com> wrote:
>>> On 11/29/2023 11:08 PM, Linus Walleij wrote:
>>>> On Wed, Nov 29, 2023 at 3:56 PM Linus Torvalds
>>>> <torvalds@linux-foundation.org> wrote:
>>>>> On Wed, 29 Nov 2023 at 04:09, Linus Walleij 
>>>>> <linus.walleij@linaro.org> wrote:
>>>>>>
>>>>>> The most interesting patch is the list iterator fix in the core by 
>>>>>> Maria
>>>>>> Yu, it took a while for me to realize what was going on there.
>>>>>
>>>>> That commit message still doesn't explain what the problem was.
>>>>>
>>>>> Why is p->state volatile there? It seems to be a serious locking bug
>>>>> if p->state can randomly change there, and the READ_ONCE() looks like
>>>>> a "this hides the problem" rather than an actual real fix.
>>>
>>> This is indeed an interesting issue. Thx for the comment, Linus.
>>> **Let me explain how: "p->state becomes volatile in the list iterator",
>>> and "why READ_ONCE is suggested".
>>>
>>> The current critical code is:
>>>     list_for_each_entry(setting, &p->state->settings, node)
>>>
>>> after elaborating the define list_for_each_entry, so above critical code
>>> will be:
>>>     for (setting = list_head(&p->state->settings, typeof(*setting), 
>>> node); \
>>> &setting->node != (&p->state->settings); \
>>> setting = list_next(setting , node))
>>>
>>> The asm code(refer result from Clang version 10.0) can cleared explain
>>> the step of p->state reload actions:
>>> loop:
>>> ldr x22,[x22] ; x22=list_next(setting , node))
>>> add x9,x8,#0x18 ; x9=&p->state->setting
>>> cmp x22,x9 ; setting,x9
>>> b.eq 0xFFFFFF9B24483530
>>>
>>> ldr w9,[x22,#0x10] ; w9,[setting,#16]
>>> cmp w9,#0x2 ; w9,#2
>>> b.ne 0xFFFFFF9B24483504
>>>
>>> mov x0,x22 ; x0,setting
>>> bl 0xFFFFFF9B24486048 ; pinmux_disable_setting
>>>
>>> ldr x8,[x19,#0x28] ; x19=p, x8=[p->state], *reload p->state*
>>> b loop
>>>
>>> The *reload p->state* inside the loop for checking is not needed and can
>>> cause possible infinite loop. So READ_ONCE is highly suggested even if
>>> p->state is not randomly changed. And then unnecessary "ldr
>>> x8,[x19,#0x28]" can be removed from above loop code.
>>>
>>> **Comments about the locking bug:
>>> currently pinctrl_select_state is an export symbol and don't have
>>> effective reentrance protect design. That's why current infinite loop
>>> issue was observed with customer's multi thread call with
>>> pinctrl_select_state without lock protection. pinctrl_select_state
>>> totally rely on driver module user side to ensure the reentrant state.
>>>
>>> Usually the suggested usage from driver side who are using pinctrl 
>>> would be:
>>> LOCK;
>>> pinctrl_select_state();
>>> gpio pulling;
>>> udelay();
>>> check state;
>>> other hardware behaviors;
>>> UNLOCK;
>>>
>>> So the locking bug fix I have told customer side to fix from their own
>>> driver part. Since usually not only a simple pinctrl_select_state call
>>> can finish the hardware state transaction.
>>>
>>> I myself also is fine to have a small per pinctrl lock to only protect
>>> the current pinctrl_select_state->pinctrl_commit_state reentrance
>>> issues. Pls any pinctrl maintainer help to comment to suggest or not and
>>> I can prepare a change as well.
>>
>> Luckily I am the pin control maintainer :D
>> And I also ha my morning coffee and looked over the patch again.
>>
>> So tilting the compiler to generate code that is less prone to race
>> conditions with READ_ONCE() isn't really the solution is it? We need
>> to introduce a proper lock that stops this from happening if it is
>> a problem people are facing.
>>
>> Can you try to make a patch that removes READ_ONCE()
>> and introduce a lock instead?
>>
>> Racing is rarely an issue in pin control for reasons explained
>> in another context here:
>> https://lore.kernel.org/linux-gpio/CACRpkdZ0cnJpYuzU=47-oW-7N_YGMo2vXpKOeXeNi5PhPY7QMA@mail.gmail.com/
>>
>> ...but if people still manage to run into it, we better have a lock
>> there. Just make sure it is not just an issue with outoftree code,
>> but a real problem?
>>
>> The change that changes the code to use the old_state variable
>> should stay in, it makes the code more readable, it's just the
>> READ_ONCE() macro which is dubious.
> Thx for confirm. I am preparing the new change now. :)
change uploaded link here:
https://lore.kernel.org/linux-gpio/20231201152931.31161-1-quic_aiquny@quicinc.com/ 

> 
> READ_ONCE can only avoid the possible infinite loop and not crash the 
> whole kernel, while the lock is needed to protect the multi parallel 
> call of pinctrl_commit_state api have a consistent atomic hardware 
> result as well.
>>
>> Yours,
>> Linus Walleij
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu


