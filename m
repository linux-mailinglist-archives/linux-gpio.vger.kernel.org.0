Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E5F6B18A1
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 02:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjCIBRs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 20:17:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjCIBRr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 20:17:47 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF07CC310
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 17:17:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNTHjIVCNAjg8yuxwg1TZhdabWgk3JkyaQ1eiSrUha+WDUthGmnm1lbTS07fGY3lCzshifKN4JvgRPmjIcfHX1qCseb/T2uUZPqno15PkV/UWPA9qAE9Nowp3d9cUqR/GsgxqO7HRNecnqtvx7a9157Ab36WV8UibqXh85zDYiKlkMo7HDj7zN8YnXhey8Ms2SOsATfik2xbn5jgfeDss1n25u2bpvpdYd3cstoYxcxq8vAO/FQHMDz37R2zuukvWBag91YOrn5QIeiYGfnU4Dr7alO+uCWNe7xpuldw4L+erL3WI5A6PxVPzxfLuYJKLoKfJnw/0Qw9R+YTyPSchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AkSVjDblDSZoPkJJwZeQ5sz5/DTTB4dAunWL6XauqQ=;
 b=PJMiwBJQ4a8uFXktYoO8w3xsea2FChZ1ozIIKgjy/C2ISgfRoD++HfJF6ngjmhX/2xGtgb85L1drz8Fk7UmGl8xnSm2MMfhNBKjBiUmMYX/jU3W9mq5C7mlKc1ypnURT8Gvo1RDcsrNZu/NHQ31rQeQfjLnR94hlUKc18V6o1EFf8YqQ/IV4mq2a1d8jtU4gbJkdI1QZ8NtP5c3jaYGPRQH04CmLmko50xmdTYaJ05jwru5H0iw/r54UcbTwtj+stBW0bdkG+Q8U6l7KenZmxb0dMNan37DDpjCxTley+kQFt1tMYB5o590pVAnuUEPSgvPM0ufmsLKBiYc96NqqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AkSVjDblDSZoPkJJwZeQ5sz5/DTTB4dAunWL6XauqQ=;
 b=AH5dRAZIkp0f48AWUNBVdeAPFTdbbvHsmYVn3Di/T6apGTZ5tDiXK4uQbliA80mkpQ8mQeVCOcZ1+hFk43QvFdXqEOe9m9c8eqiZJ7k1wZtZQDhwmVL58F07J8lC7K08gnwcCoWpZKY1cs/P8+sQG70CnhG9ITU2GtWUsuOM2EByI33z5cLe9UQNjAKAXnbZvrtheI09+D23qaQxycNHyAwWf+0chrbKsxiVpsVowHfXmMHWPfYLzdEg8BgtuhuYin6aR1+GPAl9w8oe6rj6TE3lxJuNVyuUipsRDdZ/ZAnAd8owAjjuk57dBymGf7V65x4ewgK2qnz2KHgHMil50w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 01:17:43 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::735c:fa9:2043:279a]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::735c:fa9:2043:279a%4]) with mapi id 15.20.6156.029; Thu, 9 Mar 2023
 01:17:43 +0000
Message-ID: <760827e8-6e55-177a-851e-677f54edb3a7@nvidia.com>
Date:   Wed, 8 Mar 2023 17:17:40 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Content-Language: en-US
X-Nvconfidentiality: public
To:     andriy.shevchenko@linux.intel.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
From:   Dipen Patel <dipenp@nvidia.com>
Subject: gpiolib of_node removal
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 677f56ac-721a-408c-fba3-08db203c155b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FhAVHEPUIe+dIVRfYTpIBUJZFVOypxb+83WOqkFIFPKNzdE2wWQMAoUmNNEARCgZcDH1aRurqi03NZPFF1UpwGmS0Cy7fJgsZ1EQQYlu74b4Qr+jeT0MVnxzhnsES1JBBvVwW42q1RMjgpB6ZBM1IsYC+3R1fL8np3HcxFr0TdlxaXEX3oO6JHS66xPmdmzGqRnTF/dUBrgNwVq+60OCaG0HognB/d8WV+7GPn0l3J1sLyQnGSOeA9eXqWJBZXgRylpE2CYEJvYmDAuBID3hxoNpR1WWTgkqNzsa558dB5+T0nYqnRWcWyTul7rv66s/d07AzQRha2/WpXwlCuAQpCewejEPqgD7X4w/Xlf7YuzbLuGHHFSAyL5bE0DW9z+7aQKdZIPB26PuXK8NfQLYLObEsEmUcF/3tEvj1cYZJxHn8EfYDL3hoxnyF8IOjErNd69+lFr0yFg5SvU7OKWxKGOF1wOnY95R255fhrmOMG1UcsAspAdaQ9ejVQ0+dl3zk1pMo+EFLuDv856mdYwsKdfUNLnSPuLgKPpmiWqX6voszfh+7ChuBBl/fDW9FU3AxlTBKpL6o6UoL3lcmHeLDbW4nZFThAzpnBpN++1NhmKpjSiAydxf5TMMktpSZLtCZYZO27SeXMVi0ceCqX9KkZgCktcOc0bbN0BFtbiKQen7UPImLBhVHPI2wB13WG6t8B/8NJSCigyYDW5MJSy5AflVJwwV2OIbHFRJUta6cL7DT6UodVeAjBkBRJqxjt26kPz/ujbTEsescaBLIzIGmjvmom6f5KtMim5Ijtek1ObNJox9CH+Wa1Sa9j3Z+pT/rVoiu1hujUlML2PYNcEEgmVXrm8i8KMLI6Dt02YMmis=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(2906002)(38100700002)(5660300002)(186003)(966005)(6486002)(31686004)(4744005)(6512007)(6506007)(26005)(107886003)(2616005)(66556008)(4326008)(478600001)(6916009)(8676002)(66476007)(7116003)(66946007)(8936002)(41300700001)(36756003)(316002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0tuaElQOTMyWUxzcWRFMTZWSnVmeEV5M1ArOW5uQjFFS2ZJSDh4a2drTFd6?=
 =?utf-8?B?WGJYZU44OWtkYVVJMGs1MGdFTk8yNW5qVzl0T3Zaem4xTlA3NWs0KzFRVks4?=
 =?utf-8?B?SXEwRnl5ZUt5cjdTUkY4bkxYbXFQMTdrelJBQnY0MmxOZUw2NFBVL0J0YnVj?=
 =?utf-8?B?SGxZNlhlWC84bjR6YXBjdXhCcWJTTG16UERwZ1lJb2xjdE9zck40aXBUcDNm?=
 =?utf-8?B?aW9KZmZXMHVyUFV6VU92c3BCemw2USttcVJ4QWpYREhBVzNSQ2ZQU0JhUUtC?=
 =?utf-8?B?eE4rUFFMVzRHdzFiRWd2S0xFNWdQbU5Hdzg2YnBvL3paazNWMUkvb2VSVSto?=
 =?utf-8?B?YU5DQlJSbkllaHhCVWNJazdoVE1XS0xlb1ZUbE1URXg5THZZTDY2cXFreUZp?=
 =?utf-8?B?VDV5eng4NSt6WXFiZFF0UStNRFlrOTl1R2xUY2p3NjA3eHdRbTMzYXlHZUtl?=
 =?utf-8?B?OXg3R0J3c2xrRmtvWG82OU9JU2xKYXNTUHQrZHZMaGM2amFIdFpGVmFidVhM?=
 =?utf-8?B?VnYwYWZZV0xONkVuUWZPYzZLWjh0UkhBdlhiMEhhdEcxdHIxdG1XYzFkVkY0?=
 =?utf-8?B?YlBiaGdMNEVPNG9lc2wxMTRGd2p0dTdJZFg3aFBCdU5PUlNGdXd0ZUJEbzlH?=
 =?utf-8?B?L1JsRzE4RUtKUUh3RkI3Ny8zVG9iL1laV25VNmZaZHpvVnRUUnJsTVcrNHVC?=
 =?utf-8?B?K3daamgzZG9EN2lNaFdOQm1FeVlkdzh4VHE0dFM5UiszTTNndkdybjRROFZ0?=
 =?utf-8?B?MkU5VnQvdjFqVkZ4SVRSV1YxSFBVaWZTWWJQZG5pWDFJQWdIMmpoVGx6T0JF?=
 =?utf-8?B?enFmL2ZRRktJOUtvMTdET3VhdUtRWGtUVjNkWndPSUZKUVVtM2hvaHpmZnR3?=
 =?utf-8?B?VlcwclpWOEZFcDZxUlZGR3VBeWlsZW5tYjRpM2hCMjI3ZVg3TTFnZjcyNFhG?=
 =?utf-8?B?WEZiODNkRWVEU3d1bHlON0VEd1RFTGZXSVJkY3RIR2x2aXVGT3ROeEVjQnpu?=
 =?utf-8?B?U1grRE5LVkEzbmY1MVdLM1lLQ1loUjJIZElsWE1VQ2dhNzFzeStwcXQvdjFK?=
 =?utf-8?B?Vy9CVndaS0Q2V0lsanhFQ21WUW03eXR0aTRNdGZEb0gwOXdwKzErWlVFbEo4?=
 =?utf-8?B?MGhPeWsraDE3bkx1L2NKNCs0UHhFOGhMYm9BKy8xWWJTMTBnMFZwMkduaTJI?=
 =?utf-8?B?YUw0UWJXRXpYTnpkTEhaU3ZZSjBzcE5Jb3NCTjhIOGxaSzdIVWV0a3YzeTRr?=
 =?utf-8?B?d3g2cUZObmk3ZkR4RTBNMTNYZTVyVm0vRzlDMFZGV0l0ZTNmMHNaNzhReTAz?=
 =?utf-8?B?YmZRTW9wVG9IaVA1dXNlbEx4OVgxNXIyL0dnTHFRemdESmlGVEFBSWZUOGRY?=
 =?utf-8?B?UkQvTXE0bGVLQk1IRVphbDBQZmZ0UHdNU3p6RGxTNHJ5TkRBWlBYVGJxUDZR?=
 =?utf-8?B?L1EvMVhyb2ZLdTBLWXlBbnF2NWpPeEw2SU9FWUdDbW5VTTVSVzU1S1RWRTI4?=
 =?utf-8?B?L2w0dnBSMXpwM3JOaEFHcGEyakUxNzVtb01iK3JQb1hYYU1kbWdGNHVQSS9y?=
 =?utf-8?B?dGVKMEVKSXpNU081SEszNVZYSWYvOWZRZkVNQ1JRWEU2YmtNeVlSSHJJNGk3?=
 =?utf-8?B?Q3FwekJNSTlnYlpycDAwdG1FY1VGY3pidmtlUU4vcUI2QTVMVUZ3N245RjB3?=
 =?utf-8?B?aEpxRFkyVGhtVnZoQkQ1Sm0yRzM4cWlOYjdQYUVyVHc3UXpqRmRleHdiMkdn?=
 =?utf-8?B?enk0ajNCU01idGRKa2Y1dmwwaHBneEpFdnI5cmNyTXhPTzI4QmNNWTBjSmxQ?=
 =?utf-8?B?bXdpRDhDcGJXcFpkUG13SDhTVEl0bHhPZnNoVFhaTUN1alNHQ2lBc0JSTVh4?=
 =?utf-8?B?WDhVSTFRZTlTaUNBRUNvdGJUWjZrOWM3UXF0ZUdFd3pvWWJ3MWVJa0txT250?=
 =?utf-8?B?M2hzd0ZkbU5abDZWVWhHbHhlSmc2alpQQ1ZtdlJoV3JGQ0QyaHJ4VW1ubmZC?=
 =?utf-8?B?cUdSTVV0djlrU1I1WmJqRTNHZUZvUmRLbFBMRU53MUJ6V29iNmt5VGJ1cE56?=
 =?utf-8?B?VlBKY2VYQmt1Y01MMkVCUlVwYTJvTHZCU0xnZUJaVGdYNzhrR1ZoeEhiQlhC?=
 =?utf-8?Q?8blD0t5wNKDMPDdoU3OMndTya?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677f56ac-721a-408c-fba3-08db203c155b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 01:17:43.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVPtfTfbzcOadbXFnkMefvsQ62ukewuT7PsJGx1+TmeuSqFMBA20YoEjGUTB6pn/k2Y8q0hEuToVp3MCepfTtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy, Bartosz,

I see that 6.3-rc1 has https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/gpio/driver.h?id=70d0fc4288dabd65025fde7774b4f9262afa9034
commit which removes of_node data member as it was deemed unused. Incidentally, I actually am using that member in ongoing patch series
https://patchwork.kernel.org/project/timestamp/patch/20230214115553.10416-3-dipenp@nvidia.com/ and specifically in tegra_get_gpiochip_from_of_node function.

Should I revert that patch and add it in my next patch series or is there any other way to retrieve gpio_chip?

Best Regards,
Dipen Patel
