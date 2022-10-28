Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08255611A90
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 20:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiJ1S5j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 14:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJ1S5i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 14:57:38 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF0A1D2B54
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 11:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eznVdmBMAGCv1+VrDzA9pcUQB0904N0CC/8ccOHUdzLT6c8pmqsK0e11TKWcFKLMElwINETbNfGpxTPCzngeNQacay+NqooqBAX60AR0+4nGHwtiP9nRrNqRup7rdJnhzkV++5G0xTwfxbH1lDz0++IxMlak5dfSEfRYsZ1qfse5ID4bTrZy8Msk8oh2q1wbSk1SHaTeHjG1YAFLXcV8X+SX1OJSJsE6hSrZmCa1FOk1/NWwl4iqQydRTPYPJLSfXE8PDrp6mO7PDIen9bXUU/G27cdYu/saMpDT+VIleLmJ6jZt9s8yuf5+A5AlPe5q++K5SuymfD6GG/Qf7p9Kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewS28naFW4W+RnZO/yeIyRpxnR6eeY8Rp6yAjXlsUJs=;
 b=dDmXmflj8ITp531HErlq7JEuR8XJPHHuwKMvY/npo81qZZYn8cTRxxN8KefjDovWMrlf9okdvAXxaaBJceq6xwTL4m7PVTKRRUJPU4i6Bap+VbUJIOwnPlsJM+XDdGr0WdLW4DMsLjOvw4rtJ+0hffNg2U9TNRRdTIEQ5crtKipGybhcog+xMQigUpCMzz/OiB1DfF+Iy8W5zwPvMHqTIpt8okmLMrIOFnvH5BbIuFoRfoz6sQPBXioFvEKtHJ4gXU7/QSkdPhhlbkGdt33Vp3jpOhyVThDEC4GRSiZu9qBfBNu2XdqDexcQA5Vn2YgHwT2F28j45Zwx+QYhOfpt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eilabs.com; dmarc=pass action=none header.from=eilabs.com;
 dkim=pass header.d=eilabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eilabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewS28naFW4W+RnZO/yeIyRpxnR6eeY8Rp6yAjXlsUJs=;
 b=X7XGP3qLaJ5Kq6mtpqmevEdtjYrvFAOQe7dL0q680USXzmZUPozQ3SlslphbzGRCOnD/+yWAcwm2XEBjUshMOXR23XRqYnkM2td8yDCEAXclrw+Dzb2Nj3foTQvecqxUg/2vO1ppnmU04iP2em1HFZvakDvt6np4BfT9WEDLzu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eilabs.com;
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:147::21)
 by GV1P194MB1809.EURP194.PROD.OUTLOOK.COM (2603:10a6:150:51::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 18:57:31 +0000
Received: from VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b29f:dc93:5ae6:764d]) by VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 ([fe80::b29f:dc93:5ae6:764d%7]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:57:31 +0000
Message-ID: <67bba210-09ac-32fb-bb97-8bfc40c2c200@eilabs.com>
Date:   Fri, 28 Oct 2022 20:57:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>,
        =?UTF-8?Q?D=c3=a1vid_Jenei?= <david.jenei@eilabs.com>,
        linux-gpio@vger.kernel.org
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
 <Y1luUgS25ddeSCT9@smile.fi.intel.com>
 <8b94b5a6-fac8-5087-b4da-ddba098d2265@eilabs.com>
 <ea34ed6788923b8be496317f7a962d7073946ff4.camel@collabora.com>
 <Y1q52efyv93/z8BC@smile.fi.intel.com>
Content-Language: en-US
From:   =?UTF-8?Q?Levente_R=c3=a9v=c3=a9sz?= <levente.revesz@eilabs.com>
In-Reply-To: <Y1q52efyv93/z8BC@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0033.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::46) To VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:147::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P194MB0655:EE_|GV1P194MB1809:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6bd2a0-a384-472a-2482-08dab9164403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPzGLuGcM31FLvQDA7OyIhYBk812Vjd4pRXMj75wMgIZZHKb79eG0jgYzYr3Jgt5p9rSF9efzDEBzRaYTbivpR4fsLyllqu/lkgnkxOjo2nqPkKHjCNr/qzkkNg5/K45baB3uTCis4Y3HJgBTCKkgWvt7LQtE1I/YKilG5OkVw0HaGrnYPSOUwRunrDKn/MMOTRKH0Jh98hhooBaJMXglihum8yjmjX2SK+IYRstmpCD/1meDrjUI3y6iDftgwA1y81a8Q9VMmxpDL2ZqJzWmjLNkKan71mFQE/c/W0UUbtDMqtbrRUIRqH/y0dLsEUrr4gjxhlp8oAARQHcWmPtXRDHbiHpypU9Kk8gG8/voWvMYcicAU3xylUSgLAsfYOO64q+1Hv22MCprsJ4OGgTCHz9pET4msjTphCoDujeM336xQCDwa3Rrl9OTfLIwMvDupNEYxV5ABum+uiv+JLdfCIlWuBL63D56BO66NVvdMO5ITuOOn/XtBvJGqHvnIrEunA6sHSL5lxlyYJLSzA5CoagHmp0co1/6phPo0pQoWvHwefHPUOgZKcfXEK3d+s1Wt98ydmXXH1Fw0Uam6gF31b6sd+EsJUsCBJM0ON5h5h0Vw4Ra3lVh0mxcAXBo87fxYUV2g6UljVjaaCc8G4a3dE9U+NCXEkgWSUrHjsqNTipyqnA+f30kJcQz20RwWdncHXX+cuwAcS20jXQIZ6Ax95NfJjhhoxKp7OntnTL+IykNBrsgwgZf/cAK7S4Q6sfMD//SYNE1+Mt0br6GKQxUb6OaR1J0vm4OwS6CJFd7lHnckUHvCbl35tuiG5OhqUX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P194MB0655.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39830400003)(346002)(366004)(376002)(136003)(396003)(451199015)(6512007)(478600001)(26005)(83380400001)(2616005)(186003)(2906002)(6506007)(54906003)(316002)(66556008)(6486002)(110136005)(30864003)(8936002)(8676002)(5660300002)(66946007)(4326008)(66476007)(41300700001)(7416002)(966005)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxHYU9JTmhZR2hOU2E3cHdueGVRb1JnekFSSGdEWkpxK3JCVkhIYzBKKzRK?=
 =?utf-8?B?NzRVdVBBYzlicC93QTdQNytGam9CaXdJNGxNK3l5bW5hT0NzVmpadXMvSGh5?=
 =?utf-8?B?TVJhTUlWWHpQT29mVWFhWmVLRDVlQmU5TDhUWnVGdTJZU2JGVkplS1pMcWJJ?=
 =?utf-8?B?czF4WWpHUmFYQmd0UEVLeE0vYXBsM1VNOWtaOS9RWnhkYmhNdzFVbFR2ZlNX?=
 =?utf-8?B?RW55b1hQd2hqWkxzRjdxWStKS3YvdmkvUnVsQlFYcWRaNFlhSnZ5Y3lURVkz?=
 =?utf-8?B?ZXBjbGRGajFIeUFxRFh5U0FudnRSUUtFVEEydno0SkkxbmFEeWk2RXdmT3VO?=
 =?utf-8?B?cVFLMlk5SDd4aHkzSnB6Wk1MZzE1ZVlKeXQxTGFrTnRmL2R5MzNuc1pCMWxP?=
 =?utf-8?B?RGZ2Q2F5RWp0K2VxNTUrLzRwcGpXTElTQWFMSFlGS0ZEMlBOeXRibG5nc2Ni?=
 =?utf-8?B?ekZyMWFxMzhwMytKNkQwSERndTcxTzBodUlMb1dmS25ubHBYeFREcEN2ZmVW?=
 =?utf-8?B?UG1SV2xUYXFjY0VLYUpEWXlNMFJJU1pOQ0JQckhQMHgrNWVjcHQvY0llRmtC?=
 =?utf-8?B?NGNxa2hZREI5K2MvaXN1TW5jWWtralVoQkxneTJzak1pK29NOUJUZXZjM1ZM?=
 =?utf-8?B?VkZZRTZYdGo2c015MGtNQWxLTEJBT0NZOGh5U3d2eGtzRUF6SHl6RlBBTGdn?=
 =?utf-8?B?UHp5dTFjdVJDR2RneGhPUUNTclNOL2ljV0NNR3NtbzhLZ1NOOFhLZU1HTWN3?=
 =?utf-8?B?N2ZkN1FRMnYzcjVFWHpWaktiYjdkUnhDczdKSHd5bm5qTTl5ZWFNbWoxcEU1?=
 =?utf-8?B?NVNHOW9yNHRTcVQ3MC9zMktmZFNkdzBrd1FUQlc0YU9vaURqeGk2YUhqajI3?=
 =?utf-8?B?ZUtyVkN5V2hkNkF1cnpiWGNWUzlHeUl1ZTlCNlM4bk5GSC95TDVQS2JwQVRh?=
 =?utf-8?B?TnBTc1VuK3p6aXlpNVQ5YkFpU0tYbUFDdEJEQW5ib3JIcE4xYWZ4UmdCOE9z?=
 =?utf-8?B?M1YwUHU0K2FrNkptOHk2WTFqQzBNc3ZiVytXUFliOGRWbmtTL1pvVWM5ckI2?=
 =?utf-8?B?YUlUUVFMcXBQblJ3aDc2UGFIelplT05sMnI4OGJNcVFMOXdTdkdLOU9wVC9M?=
 =?utf-8?B?VFRBaUJUSEdnL3l3NThZVDM4eUJ3aW5zdVFKRmh4SWhZaXJWcVZrSTdxSkxh?=
 =?utf-8?B?TWxVSEZzVEMyOTBhYWk3NGNublZQdmlLcEU0Q0k2YVcwSjZlWFhZSGwwK2dq?=
 =?utf-8?B?YVpORDd3Vkl3azlOODZ2YmxBS1BqQTErQnJaUmZWV2tEcFlvWEFOVEd6TWZa?=
 =?utf-8?B?Rk5WWTZGV3huRjdsMmh6VlBGQ3JDeEt4MjBUVGl2RVFSdW1mQlJHaDJ4bzJT?=
 =?utf-8?B?b2xSSlpTdzJCS2lDbEwxc3g2U3dEWk9URnVRNVBYTFJ2bkFiUjUwNVRjVnpt?=
 =?utf-8?B?YUpaeGNzNG5NbzlVYXRiaGs4SFRncXRwUHl4aVoyYUNqUnc4SGtFWW04Mmo0?=
 =?utf-8?B?NC9jaWNhUEE2VWNBaHF0UUpobEtwYTIreCtnakFFNEQwNlVIY0FPNHN6S0t2?=
 =?utf-8?B?bXg4aHRCc2ZkRE9JZmhkeFZmdVU3YS96RStKdVNrNEZnODk2RWdtbXREV3l4?=
 =?utf-8?B?eEFabENVdEFRc1U0Zko5Ykk4QnJQbjVwZ1U1VDdDd3Fscm1aTkNoTWdISjdC?=
 =?utf-8?B?UFpXNEczUkhzdGVndWZmZFBPb2o2YW1xaE94bVc1MW83TXV5OGt4bGxMUzVa?=
 =?utf-8?B?SmtnT1J3MFJpSVFHV2ZSQmkrZHlhTi9kUGtvOFZaTlhoQmc1eWhxYllQcENa?=
 =?utf-8?B?WFRDYzFmOUNWVUVsOW9FcjlwcTY0L3orU25yTHBrTW1RUUNQSzl6NkFXQ0pk?=
 =?utf-8?B?YjVkdFlCaUtLUU9hV3BuU2N4Y3dNUmVnY0dCc0hJQm41SmQyYURTaVVERGI3?=
 =?utf-8?B?WFluTEpicGxLRExJbTdmdnJUNEVFRXFYQWhWa3prVTJacHJnSmtsd2YyVmtk?=
 =?utf-8?B?dUpzSlA2Ynpkb3I5R25nVi94ZVFaaXBSTE1KOXBvOW5VbEZPMVdhRXh1YVh5?=
 =?utf-8?B?UFdvMzJyTkswVjNWRDd6R1FQQ1k5ZW5YUDF1UklRdjhMRFZ3YmR0MWRlTVRw?=
 =?utf-8?B?WTJUM3paSWZ0bkFObFJQa2hCWlZJcXdwdjRqWkdOSVd1Y1JlQzdBTGMveE5W?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: eilabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6bd2a0-a384-472a-2482-08dab9164403
X-MS-Exchange-CrossTenant-AuthSource: VI1P194MB0655.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 18:57:30.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6ef6a9ce-c7b1-47cb-80ec-8c54be45d567
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgUEivOqVJ0I7ebX1bFMc2J/81OwF9X6r5eQHo5FOB/uYa1cQpZEZOJCgoniGDBThEp1uQgJgdWVJ10op6d0HdExqxXzv/PWsHfZaj06mBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P194MB1809
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I went through all the datasheets and created this note listing
chip functions and register layouts.

Best Regards,
Levente

---

Contents:

    1. Overview of chips
    2. Overview of functions
    Datasheets


1 Overview of chips
====================

1.1 Chips with the basic 4 registers
------------------------------------

These chips have 4 register banks: input, output, invert and direction.
Each of these banks contains (lines/8) registers, one for each GPIO port.

Banks offset is always a power of 2:

    4 lines  -> bank offset is 1
    8 lines  -> bank offset is 1
    16 lines -> bank offset is 2
    24 lines -> bank offset is 4
    32 lines -> bank offset is 4
    40 lines -> bank offset is 8

Example:

    Register layout of GPIO expander with 24 lines:

    addr  function
    ----  ---------------
      00  input port0       | bank 0
      01  input port1       |
      02  input port2       |
      03  -
      04  output port0      | bank 1
      05  output port1      |
      06  output port2      |
      07  -
      08  invert port0      | bank 2
      09  invert port1      |
      0A  invert port2      |
      0B  -
      0C  direction port0   | bank 3
      0D  direction port1   |
      0E  direction port2   |
      0F  -

Note:
    This is followed by all supported chips, except by pcal6534.


  compatible lines interrupt input output invert direction
  ---------- ----- --------- ----- ------ ------ ---------
  pca9536        4        no    00     01     02        03
  pca9537        4       yes    00     01     02        03
  pca6408        8       yes    00     01     02        03
  tca6408        8       yes    00     01     02        03
  pca9534        8       yes    00     01     02        03
  pca9538        8       yes    00     01     02        03
  pca9554        8       yes    00     01     02        03
  tca9554        8       yes    00     01     02        03
  pca9556        8        no    00     01     02        03
  pca9557        8        no    00     01     02        03
  pca6107        8       yes    00     01     02        03
  pca6416       16       yes    00     02     04        06
  tca6416       16       yes    00     02     04        06
  pca9535       16       yes    00     02     04        06
  pca9539       16       yes    00     02     04        06
  tca9539       16       yes    00     02     04        06
  pca9555       16       yes    00     02     04        06
  max7318       16       yes    00     02     04        06
  tca6424       24       yes    00     04     08        0C


1.2 Chips with additional timeout_en register
---------------------------------------------

These maxim chips have a bus timeout function which can be enabled in
the timeout_en register. This is present in only two chips. Defaults to
timeout disabled.

  compatible lines interrupt input output invert direction timeout_en
  ---------- ----- --------- ----- ------ ------ --------- ----------
  max7310        8        no    00     01     02        03         04
  max7312       16       yes    00     02     04        06         08


1.3 Chips with additional int_mask register
-------------------------------------------

These chips have an interrupt mask register in addition to the 4 basic
registers. The interrupt masks default to all interrupts disabled. To
use interrupts with these chips, the driver has to set the int_mask
register.

  compatible lines interrupt input output invert direction int_mask
  ---------- ----- --------- ----- ------ ------ --------- --------
  pca9505       40       yes    00     08     10        18       20
  pca9506       40       yes    00     08     10        18       20


1.4 Chips with additional int_mask and out_conf registers
---------------------------------------------------------

This chip has an interrupt mask register, and an output port
configuration register, which can select between push-pull and
open-drain modes. Each bit controls two lines. Both of these registers
are present in PCAL chips as well, albeit the out_conf works
differently.

  compatible lines interrupt input output invert direction int_mask out_conf
  ---------- ----- --------- ----- ------ ------ --------- -------- --------
  pca9698       40       yes    00     08     10        18       20       28

pca9698 also has a "master output" register for setting all outputs per
port to the same value simultaneously, and a chip specific mode register
for various additional chip settings.

  compatible master_output mode
  ---------- ------------- ----
  pca9698               29   2A


1.5 Chips with LED blink and intensity control
----------------------------------------------

These maxim chips have no invert register.

They have two sets of output registers (output0 and output1). An internal
timer alternates the effective output between the values set in these
registers, if blink mode is enabled in the blink register. The
master_intensity register and the intensity registers together define
the pwm intensity value for each pair of outputs.

These chips can be used as simple GPIO expanders if the driver handles the
input, output0 and direction registers.

  compatible lines interrupt input output0 direction output1
  ---------- ----- --------- ----- ------- --------- -------
  max7315        8       yes    00      01        03      09
  max7313       16       yes    00      02        06      0A

  (continued...)
  compatible master_intensity blink intensity
  ---------- ---------------- ----- ---------
  max7315                  0E    0F        10
  max7313                  0E    0F        10


1.6 Basic PCAL chips
--------------------

These chips have several additional features:

    1. output drive strength setting (out_strength)
    2. input latch (in_latch)
    3. pull-up/pull-down (pull_in, pull_sel)
    4. push-pull/open-drain outputs (out_conf)
    5. interrupt mask and interrupt status (int_mask, int_status)

  compatible lines interrupt input output invert direction out_strength
  ---------- ----- --------- ----- ------ ------ --------- ------------
  pcal6408       8       yes    00     01     02        03           40
  pcal9554b      8       yes    00     01     02        03           40
  pcal6416      16       yes    00     02     04        06           40
  pcal9535      16       yes    00     02     04        06           40
  pcal9555a     16       yes    00     02     04        06           40

  (continued...)
  compatible in_latch pull_en pull_sel int_mask int_status out_conf
  ---------- -------- ------- -------- -------- ---------- --------
  pcal6408         42      43       44       45         46       4F
  pcal9554b        42      43       44       45         46       4F
  pcal6416         44      46       48       4A         4C       4F
  pcal9535         44      46       48       4A         4C       4F
  pcal9555a        44      46       48       4A         4C       4F

Currently the driver has support for the input latch, pull-up/pull-down
and uses int_mask and int_status for interrupts.


1.7 PCAL chips with extended interrupt and output configuration functions
-------------------------------------------------------------------------

These chips have the full PCAL register set, plus the following functions:

    1. interrupt event selection: level, rising, falling, any edge
    2. clear interrupt status per line
    3. read input without clearing interrupt status
    4. individual output config (push-pull/open-drain) per output line
    5. debounce inputs

  compatible lines interrupt input output invert direction out_strength
  ---------- ----- --------- ----- ------ ------ --------- ------------
  pcal6524      24       yes    00     04     08        0C           40
  pcal6534      34       yes    00     05     0A        0F           30

  (continued...)
  compatible in_latch pull_en pull_sel int_mask int_status out_conf int_edge
  ---------- -------- ------- -------- -------- ---------- -------- --------
  pcal6524         48      4C       50       54       58         5C       60
  pcal6534         3A      3F       44       49       4E         53       54

  (continued...)
  compatible int_clear input_status indiv_out_conf debounce debounce_count
  ---------- --------- ------------ -------------- -------- --------------
  pcal6524          68           6C             70       74             76
  pcal6534          5E           63             68       6D             6F


As can be seen in the table above, pcal6534 does not follow the usual
bank spacing rule. Its banks are closely packed instead.


1.8 PCA957X chips with a completely different register layout
-------------------------------------------------------------

These chips have the basic 4 registers, but at unusual addresses.

Additionally, they have:

    1. pull-up/pull-down (pull_sel)
    2. a global pull enable, defaults to disabled (config)
    3. interrupt mask, interrupt status (int_mask, int_status)

  compatible lines interrupt input invert config pull_sel direction
  ---------- ----- --------- ----- ------ ------ -------- ---------
  pca9574        8       yes    00     01     02       03        04
  pca9575       16       yes    00     02     04       06        08

  (continued...)
  compatible output int_mask int_status
  ---------- ------ -------- ----------
  pca9574        05       06         07
  pca9575        0A       0C         0E


Currently the driver supports none of the advanced features.


1.9 XRA1202
-----------

Basic 4 registers, plus advanced features:

    1. interrupt mask, defaults to interrupts disabled
    2. interrupt status
    3. interrupt event selection, level, rising, falling, any edge
       (int_mask, rising_mask, falling_mask)
    4. pull-up (no pull-down)
    5. tri-state
    6. debounce

  compatible lines interrupt input output invert direction pullup_en
  ---------- ----- --------- ----- ------ ------ --------- ---------
  xra1202        8       yes    00     01     02        03        04

  (continued...)
  compatible int_mask tristate int_status rising_mask falling_mask debounce
  ---------- -------- -------- ---------- ----------- ------------ --------
  xra1202          05       06         07          08           09       0A


2 Overview of functions
=======================

This section lists chip functions that are supported by the driver
already, or are at least common in multiple chips.

2.1 Input, Output, Invert, Direction
------------------------------------

The basic 4 GPIO functions are present in all but one chip category (chips
listed under 1.5 are missing the invert register).

3 different layouts are used for these registers:

    1. banks 0, 1, 2, 3 with bank offsets of 2^n
        - all other chips

    2. banks 0, 1, 2, 3 with closely packed banks
        - pcal6534

    3. banks 0, 5, 1, 4 with bank offsets of 2^n
        - pca9574
        - pca9575


2.2 interrupts
--------------

2.2.1 Only an interrupt mask register

The same layout is used for all of these:

    1. bank 5 with bank offsets of 2^n
        - pca9505
        - pca9506
        - pca9698

2.2.2 Interrupt mask and interrupt status registers

These work the same way in all of the chips: mask and status have
one bit per line, 1 in the mask means interrupt enabled.

Layouts:

    1. base offset 0x40, bank 5 and bank 6, bank offsets of 2^n
        - pcal6408
        - pcal6416
        - pcal9535
        - pcal9554b
        - pcal9555a
        - pcal6524

    2. base offset 0x30, bank 5 and 6, closely packed banks
        - pcal6534

    3. bank 6 and 7, bank offsets of 2^n
        - pca9574
        - pca9575

    4. bank 5 and 7, bank offsets of 2^n
        - xra1202

2.2.3 Interrupt on specific edges

Chips under 1.7 have an int_edge register. This contains 2 bits per line,
one of 4 events can be selected for each line:
    0: level, 1: rising edge, 2: falling edge, 3: any edge

Layouts:

    1. base offset 0x40, bank 7, bank offsets of 2^n
        - pcal6524

    2. base offset 0x30, bank 7 + offset 0x01, closely packed banks
       (out_conf is 1 byte, not (lines/8) bytes, hence the 0x01 offset)
        - pcal6534

Chips under 1.9 have a different mechanism for the same thing: they have
a rising mask and a falling mask, with one bit per line.

Layout:

    1. bank 5, bank offsets of 2^n


2.3 Input latch
---------------

Only PCAL chips (1.6 and 1.7) have this function. When the latch is
enabled, the interrupt is not cleared until the input port is read.
When the latch is disabled, the interrupt is cleared even if the
input register is not read, if the input pin returns to the logic value
it had before generating the interrupt. Defaults to latch disabled.

Currently the driver enables the latch for each line with interrupt
enabled.

    1. base offset 0x40, bank 2, bank offsets of 2^n
        - pcal6408
        - pcal6416
        - pcal9535
        - pcal9554b
        - pcal9555a
        - pcal6524

    2. base offset 0x30, bank 2, closely packed banks
        - pcal6534


2.4 Pull-up and pull-down
-------------------------

Chips under 1.6 and 1.7 (PCAL) use the same mechanism: their pull_en
register enables the pull-up or pull-down function, and their pull_sel
register chooses the direction. They all use one bit per line.

    0: pull-down, 1: pull-up

Layouts:

    1. base offset 0x40, bank 3 (en) and 4 (sel), bank offsets of 2^n
        - pcal6408
        - pcal6416
        - pcal9535
        - pcal9554b
        - pcal9555a
        - pcal6524

    2. base offset 0x30, bank 3 (en) and 4 (sel), closely packed banks
        - pcal6534


Chips under 1.8 have a pull_sel register with one bit per line, and a
global pull_en bit in their config register.

Layout:

    1. bank 2 (config), bank 3 (sel), bank offsets of 2^n
        - pca9574
        - pca9575


Chips under 1.9 can only pull-up. They have a pullup_en register.

Layout:

    1. bank 4, bank offsets of 2^n
        - xra1202


2.5 Push-pull and open-drain
----------------------------

Chips under 1.4 have this function, but only for select IO ports.
Register has 1 bit per 2 lines. In pca9698, only port0 and port1 have
this function.

    0: open-drain, 1: push-pull

Layout:

    1. base offset 5*bankoffset
        - pca9698

Chips under 1.6 have 1 bit per port in one single out_conf
register. Only whole ports can be configured.

    0: push-pull, 1: open-drain

Layout:

    1. base offset 0x4F
        - pcal6408
        - pcal6416
        - pcal9535
        - pcal9554b
        - pcal9555a


Chips under 1.7 can set this for each line individually. They have the
same per-port out_conf register as chips under 1.6, but they also have
an indiv_out_conf register with one bit per line, which inverts the
effect of the port-wise setting.

    0: push-pull, 1: open-drain

Layouts:

    1. base offset 0x40 + 7*bankoffset (out_conf),
       base offset 0x60, bank 4 (indiv_out_conf) with bank offset of 2^n
        - pcal6524

    2. base offset 0x30 + 7*banksize (out_conf),
       base offset 0x54, bank 4 (indiv_out_conf), closely packed banks
        - pcal6534


This function is currently not supported by the driver.


2.6 Output drive strength
-------------------------

Only PCAL chips have this function. 2 bits per line.

    00  0.25x
    01  0.50x
    10  0.75x
    11  1.00x

    1. base offset 0x40, bank 0 and 1, bank offsets of 2^n
        - pcal6408
        - pcal6416
        - pcal9535
        - pcal9554b
        - pcal9555a
        - pcal6524

    2. base offset 0x30, bank 0 and 1, closely packed banks
        - pcal6534


Currently not supported by the driver.


Datasheets
==========

https://assets.maxlinear.com/web/documents/xra1202_1202p_101_042213.pdf
https://datasheets.maximintegrated.com/en/ds/MAX7310.pdf
https://datasheets.maximintegrated.com/en/ds/MAX7312.pdf
https://datasheets.maximintegrated.com/en/ds/MAX7313.pdf
https://datasheets.maximintegrated.com/en/ds/MAX7315.pdf
https://datasheets.maximintegrated.com/en/ds/MAX7318.pdf
https://pdf1.alldatasheet.com/datasheet-pdf/view/161780/TI/PCA6107.html
https://www.nxp.com/docs/en/data-sheet/PCA6408A.pdf
https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9534.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9535_PCA9535C.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9536.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9537.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9538.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9539_PCA9539R.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9554_9554A.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9555.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9556.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9557.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9574.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9575.pdf
https://www.nxp.com/docs/en/data-sheet/PCA9698.pdf
https://www.nxp.com/docs/en/data-sheet/PCAL6408A.pdf
https://www.nxp.com/docs/en/data-sheet/PCAL6416A.pdf
https://www.nxp.com/docs/en/data-sheet/PCAL6524.pdf
https://www.nxp.com/docs/en/data-sheet/PCAL6534.pdf
https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf
https://www.nxp.com/docs/en/data-sheet/PCAL9554B_PCAL9554C.pdf
https://www.nxp.com/docs/en/data-sheet/PCAL9555A.pdf
https://www.ti.com/lit/gpn/tca6408a
https://www.ti.com/lit/gpn/tca6416
https://www.ti.com/lit/gpn/tca6424
https://www.ti.com/lit/gpn/tca9539
https://www.ti.com/lit/gpn/tca9554
