Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E00462FA9C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 17:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242224AbiKRQpH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 11:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241647AbiKRQpB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 11:45:01 -0500
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2126.outbound.protection.outlook.com [40.107.11.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C16CE0E
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 08:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PemeL1UnqX3foFSc41hnRL3dkcqCFmndoqxFT5EMI1RFgoO3SwrdI7/4uLPHSOmYNQ7B57I2kGLnXnXu0N4bylXjtcmbfne694EVGIhtk632tP5LTZs1k2ESNOQ/N9dbTeCUh2YI2XSrF2N9jnN29NH4xekdQduhQcozgXU096scAwSQ2uykIDe1sY/GQ0+7V/vzS5L/U5ku9fsoSWDYhnNVjzLJB1Omeys80VFsp6CBiA3xJsruvXGn2nzjVCPaMz2onOAadTfvZfS8HkjPBK1Bg7IK+a21bR/tHEyV0QZ+LNqqhqXu/wQh0CHgEXyRcdqYT+oBobDS5Ew43fM1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qZveMSOC3N8e0mgvloL0jTi+e9s1Dl7DPmoqQoEb6M=;
 b=UxJL39/eaWx5JUVXPd29UfImPov/O6j/UxNILwxZLYTyi/6//013BQR1XROz7Yfbsrfh8whV+0I7AsoSqEWAQLPG/ifkzvizB2sk2GhTycG5Ml6Cbsy1XQf2qBRWdG5qloRdwqZq94zCqFbs1pWYaSyR1ZnqarLpRcJ1pl+dIQbWBe5tEnPKmFdRPGHoFfqWpK5s7b4YS+IwDJ8KiJRdfJJRwP0s/xzrT6A8Hnzf3/IGjHLemMo1e5TebImzNMQTN8MNjw4iEe1yg0HNFWJmPBvu5Ptoi7HwQU+EYGDGYyGDs35hMfvI7NK444rwPIcWt6ok1HdA71otqojd2plOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qZveMSOC3N8e0mgvloL0jTi+e9s1Dl7DPmoqQoEb6M=;
 b=IftPW+QlSVF3PaQpZAoQzC0z9XsycdPH4wqQ8iyK6jzHtPZ3daCmBFqAYzMDIeNci5x4FYiW98Cxzu6m6QR8LgakbwBwvqVlwEzSzngIdTMgJa781SOMweWfaVXRORRuXGBhf4q2qm3ivKASvLuArsc7k48XbuhJ+RYuoFg/g3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB5747.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 16:44:58 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c07:e2da:3210:3fd7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c07:e2da:3210:3fd7%6]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 16:44:58 +0000
Date:   Fri, 18 Nov 2022 16:44:56 +0000
From:   Gary Guo <gary@garyguo.net>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221118164456.44f448e8@GaryWorkstation>
In-Reply-To: <Y3Q44X7+DxoVefD5@sol>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
        <CAMRc=Mc=NVzo-R8Yg8SSos6rSaru_i4+m3qpXeZcKsHH6hcOAg@mail.gmail.com>
        <Y3Q44X7+DxoVefD5@sol>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0251.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::22) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 2864f2e2-6014-433c-2e36-08dac9843a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CqnftLB6H8wcbuhJXpAh79BSoE06Vd2kOxy3L7+wY7gXiFYC99hU3W8Ym0L0pE1WUE1WjCHc6VWqK5rERVzMPOJWuMR8kit9c1OoCIWRHZsQXXR7SGarvqzeagjYXOCJvErb8UmWdIUNhdui7ZYFL4y/FPa2OazgMozs+1xPPfPcxE0PxpID6b6A1FICYoGsDfD885op1cCI4KXAADdLNb+ClZsDbovvWJ5FVmSMiNEGKBiIg2WbI0AqLA2ddA/yLGIgJRA3Eq7YCYjy1RSHbiyo/G/K9KlPU2zjiAqluhJSOcXMEVMzXkff9JlIZd0Jn4HRqI9zQMs3TkuLH7sW1mf8DUWzuqgAkNJnxvmeiwODS6EpitA3hhOsx4GAbxZYxFF4Vd6nLC3q2cSeX4RRjd4felNX38kL3z0GufUfrQ6Mu2sJW0bI2jZeKrWnhuKtCHTxc4PWQ+Sgenm7DXFLac89+JHo84IulZuNi4562NrKt08VyU2DhvAlkNp8TvHCVdz8OR6xvVAALppaLZ3Vg3jCb+bdjvxx1Hqar1Pocdr81C7/aePzd67Lj1BG983qLmK0lq7btL/50juC+0Q7MqCcymIubSrZ3knBVCSbt46SceLryEs8rfmJvUrimauYen133wuXXqrgcX6zthZRzRiJyG9U7ZzN2EjTiDZKIbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(451199015)(83380400001)(5660300002)(8936002)(186003)(1076003)(41300700001)(2906002)(86362001)(38100700002)(33716001)(6506007)(53546011)(6916009)(54906003)(316002)(966005)(7416002)(6512007)(9686003)(478600001)(6486002)(66476007)(8676002)(66556008)(66946007)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yaPF5W3ZoHNWQs+PBNcSq/EqSnEsysuERk1Zgq9mH6SSeiU/CWN7JLmn2Iyr?=
 =?us-ascii?Q?cyHbz/KSinUI3BDtDxg1YI1RT44tPyrl348XSPibHAf5TBU3WzRsybrPo0AJ?=
 =?us-ascii?Q?MnodOPJAp/9mV0j5z3lFXZtH1ZZt3WJ4B5/QMR4Ww3dDjt/sKwt3yQGYU7eP?=
 =?us-ascii?Q?1IGsoLzfWsc2QDa5oySSa9FubxLMkUdcdCwC9AhCRBv9WwllBgUK5k9q18cP?=
 =?us-ascii?Q?/j+7g4MOeIipqLw2r3gULKi/2xDd9IjCGbOaQVH0Vs0XXENJ0LGrJWWjH4ua?=
 =?us-ascii?Q?VsMgvy/6GzB5qovHMuFZIKMvxZpaeDoTOgJQF8+miie40O3eELg6u0gw8B2s?=
 =?us-ascii?Q?60Gaxfawb16Bv2lYiDhMUB7PvHUi7VnyLcEzdBMLTpkcAPSISh7G1MY7AhzR?=
 =?us-ascii?Q?1yJgu/JdpBxASX6rGhhs4CjHKVycVxycqbkRc767Q5mlbOgfb5eTccNAkHbv?=
 =?us-ascii?Q?6bvkE1AaiOji03Rtwet8g1/FMIsjs/3F7pN3XVcrXqiMyndR6Sh/dy79ee4T?=
 =?us-ascii?Q?rbbvgHoCJeEyKBV5Py490NDatSK+Q/g5N7N1PRC/zsoql1vlFybMCT+zduEH?=
 =?us-ascii?Q?vAdZhubOu1zaJC542TbzxA+HF8dqYmUUwTTUn8yA+yWdoClis+3n9bOsMcko?=
 =?us-ascii?Q?0bupVvl0v1h55/ZR9II97FCKKoV6JezjMpfhNmFnBSwk4ARvdeoj11kBiGTX?=
 =?us-ascii?Q?6LSL1B2Z5HGgdlS94x7qoA+GtOKr8C+wqgEQajDQK3UyLzGUH4Ko2YkBuP+z?=
 =?us-ascii?Q?rdBpRifqP/6tNRcoNdRLvybFAyWyRxSlbhrO+WtAK+WepLiwJRc3ZTyowEU+?=
 =?us-ascii?Q?zIWcUJAVxWW41uLYD6opSe4jaeHvU+MntAbTxRJMX9nCKl8jvczWMxUxs3AA?=
 =?us-ascii?Q?Zxk84k2Qm43lC+NcIohn5FI6RSk4zZ2SbcMY5y9hT4lBPrF6KDDTo2urvfS9?=
 =?us-ascii?Q?PLbGLh1DlVK17YvCTtMiBSwqXlY1718z5b7S+ITWASsfSRsMc3BJA+dIW/1W?=
 =?us-ascii?Q?CIZVQJ3+bO9E4A6KMItakj70cIKNAhOam+r6A7lGcs9VeUObh58sIhaWMh3z?=
 =?us-ascii?Q?H3JHTCtPDZjom1fx+R21uS9DjhNmXwZfoZPaoFTGLNr4M/Cod+2VULycWlra?=
 =?us-ascii?Q?dyo7Bhscl70YJiVHfEgu6Ary+8Ag4wKjSHffqNsiM9UnASkLNJCibUFm1GXm?=
 =?us-ascii?Q?BV+NmIAt6TAsY0446sTuNJazWJX2kuKJmGEP5BtEbeWgYGLa3eRb34+aQhzX?=
 =?us-ascii?Q?RCkCCjodqmvx5y0oQEiwdyDjinVUvpxZGoHORbYaFS1pJ+U3EFyPtmtNKduT?=
 =?us-ascii?Q?awyCl0rFGNlw7ssgjwyUCiObRNg/lw2SU590i3phGFnol30lgoW4g0xKS0iD?=
 =?us-ascii?Q?2Ypy092leBG4i+kQeeKRL+HBcKtCkVwTr8ErrcRw5G0ZYk2epE+JRu3RtqJe?=
 =?us-ascii?Q?Ym9rZVNoJ1YSsncbxuDrrF9kP19P2oxtckqu+eRSKweIFwAHtYAO63GF6pJr?=
 =?us-ascii?Q?2zqe45yUlNPYk7HpSNYPFBaMXlbppsRcT6+KwmvQ4/ASHxPWB46PV4/MoxgS?=
 =?us-ascii?Q?UvdJN5qvvXGuhr5F1GGWtAgItdq57opS62PlPYDWJW3VYspmiVfDGne5CadU?=
 =?us-ascii?Q?3VmPFHnKRs+NYzgvRIWWCFsS4HKjQHejkpq4pzgPbKRd?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2864f2e2-6014-433c-2e36-08dac9843a62
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 16:44:57.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTWjk4D5VIpcHLCb5q3p30WkJLcP7nO6bdJKf+ZgIvDmAJ2DbL4Yw3rtN92loOvtVK/aa0GlzSgRYnQU3E0b/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5747
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Nov 2022 09:12:01 +0800
Kent Gibson <warthog618@gmail.com> wrote:

> On Mon, Nov 14, 2022 at 10:49:36PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:  
> > >
> > > Hello,
> > >
> > > Here is another version of the rust bindings, based of the master branch.
> > >
> > > Pushed here:
> > >
> > > https://github.com/vireshk/libgpiod v9
> > >
> > > V8->V9:
> > > - Merged the last patch (supporting Events) with the other patches.
> > > - Events implementation is simplified and made efficient. nth() is also
> > >   implemented for the iterator.
> > > - Unnecessary comment removed from Cargo.toml files.
> > > - Updated categories in libgpiod's Cargo.toml.
> > > - Updated gpio_events example to show cloned events live past another
> > >   read_edge_events().
> > > - Implement AsRawFd for Chip.
> > > - Other minor changes.
> > >  
> > 
> > Kent, Miguel: if you are ok with this version - can you add your review tags?
> > 
> > Bart  
> 
> As mentioned elsewhere, I'm a bit iffy about the handling of non-UTF-8
> names, which are treated as errors, but are valid in the C API.
> But that is an extreme corner case that can be addressed later, so I have
> no objection to this version being merged.
> 
> Reviewed-by: Kent Gibson <warthog618@gmail.com>
> 
> Cheers,
> Kent.

I have glanced through the code and I find no reason that the `str` used
couldn't be replaced with `[u8]` or `OsStr`. The former might be a
little bit difficult to use, but `OsStr` could be easily converted into
`str` by just `.to_str().expect("name should be utf-8")` if the user
don't care about non-UTF-8 or is certain that names are indeed UTF-8.

I am not sure about whether this would be worthwhile though, because I
doubt if anyone is actually using non-UTF-8 strings in those places.
Non-ASCII usages should already be rare?

Best,
Gary


